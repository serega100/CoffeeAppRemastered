import 'package:coffee_app_remastered/data/id.dart';
import 'package:coffee_app_remastered/model/product/category.dart';
import 'package:coffee_app_remastered/model/product/product.dart';

class MenuHolder {
  Map<Category, List<Product>> _productMap;

  MenuHolder(Map<Category, List<Product>> productMap)
      : _productMap = productMap;

  List<Category> getCategories() {
    var list = _productMap.keys.toList();
    return list;
  }

  List<Product> getProducts(Category category) {
    return _productMap[category]!;
  }

  Product? getProductById(Id<Product> id) {
    for (var list in _productMap.values) {
      for (var product in list) {
        if (product.id == id) {
          return product;
        }
      }
    }
    return null;
  }

  Map<Category, List<Product>> getMap() {
    return _productMap;
  }
}
