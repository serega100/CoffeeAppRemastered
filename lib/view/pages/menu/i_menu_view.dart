import 'package:coffee_app_remastered/model/menu_holder.dart';
import 'package:coffee_app_remastered/model/product/product.dart';

abstract class IMenuView {
  set menuHolder(MenuHolder menuHolder);
  void updateMenuHolder();
  void showAddedNotification(Product product);
}