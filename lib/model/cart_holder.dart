import 'package:coffee_app_remastered/model/product/product.dart';

class CartHolder {
  List<Product> _productList;
  double _sum;

  CartHolder(List<Product> list)
      : _productList = list,
        _sum = _sumPrices(list);

  double get sum => _sum;

  void addItem(Product product) {
    _countSum();
    _productList.add(product);
  }

  void removeItem(int itemId) {
    _productList.removeAt(itemId);
    _countSum();
  }

  List<Product> getItems() {
    return _productList;
  }

  void _countSum() {
    _sum = _sumPrices(_productList);
  }

  static double _sumPrices(Iterable<Product> products) {
    var sum = 0.0;
    for (var product in products) {
      sum += product.price;
    }
    return sum;
  }
}
