import 'package:coffee_app_remastered/data/personal/i_personal_data_manager.dart';
import 'package:coffee_app_remastered/model/product/product.dart';

class CartHolder {
  final IPersonalDataManager _dataManager;
  List<Product> _productList;
  double _sum;

  CartHolder({
    required List<Product> productList,
    required IPersonalDataManager dataManager,
  })  : _productList = productList,
        _dataManager = dataManager,
        _sum = _sumPrices(productList);

  double get sum => _sum;

  void addItem(Product product) {
    _countSum();
    _productList.add(product);
    _dataManager.cartHolder = this;
  }

  void removeItem(int itemId) {
    _productList.removeAt(itemId);
    _countSum();
    _dataManager.cartHolder = this;
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
