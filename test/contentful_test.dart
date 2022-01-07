import 'dart:async';

import 'package:coffee_app_remastered/data/general/contentful_data_manager.dart';
import 'package:coffee_app_remastered/data/id.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/oppening_hours.dart';
import 'package:coffee_app_remastered/model/map/location.dart';
import 'package:coffee_app_remastered/model/product/category.dart';
import 'package:coffee_app_remastered/model/product/product.dart';
import 'package:coffee_app_remastered/model/product/volume_units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final Completer<ContentfulDataManager> dataManager = Completer();
bool willManagerCompleted = false;

Future<ContentfulDataManager> getDataManager() async {
  if (willManagerCompleted) return await dataManager.future;
  willManagerCompleted = true;
  var dManager = ContentfulDataManager();
  dataManager.complete(dManager);
  return dManager;
}

void main() {
  group("Contentful tests", () {
    final testAddressList = {
      "просп. Ленина, д. 36",
      "ул. Мира, д. 19 (этаж 1)",
      "ул. Малышева, д. 113",
    };

    test("Get addressList", () async {
      getDataManager().then((manager) => manager.addressHolderFuture);
    });

    test("Check multiple address titles", () async {
      getDataManager().then((manager) {
        manager.addressHolderFuture.then((aHolder) {
          expect(aHolder.list.map((a) => a.title).toSet(),
              testAddressList.toSet());
        });
      });
    });

    test("One address tests", () async {
      final testAddress = Address(
        id: Id<Address>(
          sourceId: "contentful_cdn",
          value: "23OfVoi9A1KLK7BfMo7hK7",
        ),
        title: "просп. Ленина, д. 36",
        subtitle: "г. Екатеринбург",
        location: Location(
          latitude: 56.83859219356317,
          longitude: 60.609320334756056,
        ),
        openingHours: OpeningHours.utc(
          openHour: 8-5,
          openMinute: 0,
          closeHour: 22-5,
          closeMinute: 0,
        ),
      );

      var manager = await getDataManager();
      var holder = await manager.addressHolderFuture;
      var address = holder.getAddressById(testAddress.id);
      assert(address != null);
      expect(address!.id, testAddress.id);
      expect(address.title, testAddress.title);
      expect(address.subtitle, testAddress.subtitle);
      expect(address.location.longitude, testAddress.location.longitude);
      expect(address.location.latitude, testAddress.location.latitude);
      expect(address.openingHours.openHour, testAddress.openingHours.openHour);
      expect(address.openingHours.openMinute, testAddress.openingHours.openMinute);
      expect(address.openingHours.closeHour, testAddress.openingHours.closeHour);
      expect(address.openingHours.closeMinute, testAddress.openingHours.closeMinute);
    }
    );

    test("Get one product test", () async {
      final testProduct = Product(
        id: Id<Product>(
            sourceId: "contentful_cdn", value: "55P07nZIN2QNPKYttuAaA9"),
        title: "Капучино",
        category: Category(
          id: Id<Category>(
              sourceId: "contentful_cdn", value: "1jx1uzlIXPtmJcu6TzMbaC"),
          title: "Кофе",
          orderPriority: 1,
        ),
        volume: 250,
        volumeUnits: VolumeUnits.ml,
        price: 170,
        image: Image.network(
                "//images.ctfassets.net/oc8psz0qxnw9/4L6YjopOjCLtjgQRqVPMVH/15d37065082e8c2c93fdf8e5f6dd81e8/cappuccino.jpg")
            .image,
      );
      var manager = await getDataManager();
      var holder = await manager.menuHolderFuture;
      var product = holder.getProductById(testProduct.id);
      assert (product != null);
      expect(product!.id, testProduct.id);
      expect(product.title, testProduct.title);
      expect(product.category.id, testProduct.category.id);
      expect(product.category.title,  testProduct.category.title);
      expect(product.volume, testProduct.volume);
      expect(product.volumeUnits, testProduct.volumeUnits);
      expect(product.price, testProduct.price);
      expect(product.image == testProduct.image, true);
    });
  });
}
