import 'package:coffee_app_remastered/data/id.dart';
import 'package:coffee_app_remastered/data/personal/i_personal_data_manager.dart';
import 'package:coffee_app_remastered/model/menu_holder.dart';
import 'package:coffee_app_remastered/model/product/product.dart';
import 'package:coffee_app_remastered/view/view_utils.dart';

import 'cart_item.dart';

class CartHolder {
  final IPersonalDataManager _dataManager;
  List<CartItem> _itemList; // todo move to CartItem
  double _sum;

  CartHolder({
    required List<CartItem> itemList,
    required IPersonalDataManager dataManager,
  })  : _itemList = itemList,
        _dataManager = dataManager,
        _sum = _sumPrices(itemList);

  double get sum => _sum;

  String get stringSum => ViewUtils.beautifyPrice(sum);

  void addItem(CartItem item) {
    _countSum();
    _itemList.add(item);
    _dataManager.setCartHolder(this);
  }

  void removeItem(int itemId) {
    _itemList.removeAt(itemId);
    _countSum();
    _dataManager.setCartHolder(this);
  }

  List<CartItem> getItems() {
    return _itemList;
  }

  void _countSum() {
    _sum = _sumPrices(_itemList);
  }

  static double _sumPrices(Iterable<CartItem> items) {
    var sum = 0.0;
    for (var item in items) {
      sum += item.product.price;
    }
    return sum;
  }

  static CartHolder fromLocalJson({
    required MenuHolder menu,
    required IPersonalDataManager dataManager,
    required dynamic json,
  }) {
    var itemList = <CartItem>[];
    if (json != null && json is List<dynamic>) {
      for (var itemJson in json) {
        var idJson = itemJson["productId"];
        var id = Id<Product>.fromLocalJson(idJson);
        var product = menu.getProductById(id);
        if (product != null) {
          var item = CartItem(product: product);
          itemList.add(item);
        }
      }
    }
    return CartHolder(itemList: itemList, dataManager: dataManager);
  }

  dynamic toLocalJson() {
    var jsonList = <dynamic>[];
    for (var item in _itemList) {
      var jsonMap = <String, dynamic>{
        "productId": item.product.id.toLocalJson(),
      };
      jsonList.add(jsonMap);
    }
    return jsonList;
  }
}
