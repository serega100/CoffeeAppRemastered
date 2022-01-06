import 'dart:async';
import 'dart:convert';

import 'package:coffee_app_remastered/data/exception/no_internet_exception.dart';
import 'package:coffee_app_remastered/data/general/i_general_data_manager.dart';
import 'package:coffee_app_remastered/data/id.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/model/map/address/oppening_hours.dart';
import 'package:coffee_app_remastered/model/map/location.dart';
import 'package:coffee_app_remastered/model/menu_holder.dart';
import 'package:coffee_app_remastered/model/product/category.dart';
import 'package:coffee_app_remastered/model/product/product.dart';
import 'package:coffee_app_remastered/model/product/volume_units.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ContentfulDataManager implements IGeneralDataManager {
  static const sourceId = "contentful_cdn";
  static const spaceId = "oc8psz0qxnw9";
  static const accessToken = "IhmcpwE0Y9eBDsFLGxpGPo1zPU_Q2PU8MwGZPyMbPZo";
  static const environmentId = "master";
  static const requestUrl = "https://cdn.contentful.com/spaces/$spaceId/"
      "environments/$environmentId/entries?access_token=$accessToken";

  static const types = <String, Type>{
    "address": Address,
    "productCategory": Category,
    "product": Product,
  };

  final Completer<AddressHolder> _addressHolderCompleter = Completer();
  final Completer<MenuHolder> _menuHolderCompleter = Completer();

  @override
  Future<AddressHolder> get addressHolderFuture =>
      _addressHolderCompleter.future;

  @override
  Future<MenuHolder> get menuHolderFuture => _menuHolderCompleter.future;

  ContentfulDataManager() {
    http.get(Uri.parse(requestUrl)).then((response) {
      var addressList = <Address>[];
      var categoryList = <Category>[];
      var productMap = <Category, List<Product>>{};

      if (response.statusCode != 200) throw NoInternetException();

      var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var imageMap = _getAssetImages(json);
      var productJsonList = <dynamic>[];
      for (var itemJson in json["items"]) {
        var strType = itemJson["sys"]["contentType"]["sys"]["id"] as String;
        var type = types[strType]!;
        switch (type) {
          case Address:
            var object = _parseAddress(itemJson);
            addressList.add(object);
            break;
          case Category:
            var object = _parseCategory(itemJson);
            categoryList.add(object);
            break;
          case Product:
            productJsonList.add(itemJson);
            break;
        }
      }

      productMap = _parseProducts(productJsonList, categoryList, imageMap);

      var addressHolder = AddressHolder(addressList);
      _addressHolderCompleter.complete(addressHolder);
      var menuHolder = MenuHolder(productMap);
      _menuHolderCompleter.complete(menuHolder);
    });
  }

  Address _parseAddress(dynamic itemJson) {
    var id = Id<Address>(
      sourceId: sourceId,
      value: _parseIdValue(itemJson),
    );
    var title = itemJson["fields"]["title"] as String;
    var subtitle = itemJson["fields"]["subtitle"] as String;
    var locLon = itemJson["fields"]["location"]["lon"] as double;
    var locLat = itemJson["fields"]["location"]["lat"] as double;
    var location = Location(latitude: locLat, longitude: locLon);
    var openTimeStr = itemJson["fields"]["openTime"] as String;
    var closeTimeStr = itemJson["fields"]["closeTime"] as String;
    var openTime = DateTime.parse(openTimeStr);
    var closeTime = DateTime.parse(closeTimeStr);
    var openingHours = OpeningHours.utc(
      openHour: openTime.hour,
      openMinute: openTime.minute,
      closeHour: closeTime.hour,
      closeMinute: closeTime.minute,
    );

    return Address(
      id: id,
      title: title,
      subtitle: subtitle,
      location: location,
      openingHours: openingHours,
    );
  }

  Category _parseCategory(dynamic itemJson) {
    var id = Id<Category>(
      sourceId: sourceId,
      value: _parseIdValue(itemJson),
    );
    var title = itemJson["fields"]["name"] as String;
    return Category(
      id: id,
      title: title,
    );
  }

  Map<Category, List<Product>> _parseProducts(dynamic productJsonList,
      List<Category> categoryList, Map<String, ImageProvider> imageMap) {
    var map = <Category, List<Product>>{};
    for (var cat in categoryList) {
      map[cat] = <Product>[];
    }

    for (var itemJson in productJsonList) {
      var product = _parseProduct(itemJson, categoryList, imageMap);
      map[product.category]!.add(product);
    }

    return map;
  }

  Product _parseProduct(dynamic itemJson, List<Category> categoryList,
      Map<String, ImageProvider> imageMap) {
    var id = Id<Product>(
      sourceId: sourceId,
      value: _parseIdValue(itemJson),
    );
    var title = itemJson["fields"]["title"] as String;
    var categoryStrId = itemJson["fields"]["category"]["sys"]["id"] as String;
    var category = _getCategoryById(categoryList, categoryStrId);
    var volume = (itemJson["fields"]["volume"] as int).toDouble();
    var volumeUnitsStr = itemJson["fields"]["volumeUnits"] as String;
    var volumeUnits = _parseUnits(volumeUnitsStr);
    var price = (itemJson["fields"]["price"] as int).toDouble();
    var imageStrId = itemJson["fields"]["image"]["sys"]["id"] as String;
    var image = imageMap[imageStrId]!;

    return Product(
      id: id,
      title: title,
      category: category,
      volume: volume,
      volumeUnits: volumeUnits,
      price: price,
      image: image,
    );
  }

  Category _getCategoryById(List<Category> list, String id) {
    for (var el in list) {
      if (el.id.value == id) {
        return el;
      }
    }
    throw "ContentfulDataManager | No category with id '$id'";
  }

  String _parseIdValue(dynamic itemJson) {
    return itemJson["sys"]["id"] as String;
  }

  VolumeUnits _parseUnits(String string) {
    switch (string) {
      case "г":
        return VolumeUnits.grams;
      case "мл":
        return VolumeUnits.ml;
      default:
        throw "ContentfulDataManager | Volume Units '$string' doesn't exists";
    }
  }

  Map<String, ImageProvider> _getAssetImages(dynamic generalJson) {
    var map = <String, ImageProvider>{};

    var allAssetsJson = generalJson["includes"]["Asset"];
    for (var assetJson in allAssetsJson) {
      var id = assetJson["sys"]["id"] as String;
      var type = assetJson["fields"]["file"]["contentType"] as String;
      if (!type.contains("image")) continue;

      var strUrl = assetJson["fields"]["file"]["url"] as String;
      var image = Image.network("https:" + strUrl).image;
      map[id] = image;
    }

    return map;
  }
}
