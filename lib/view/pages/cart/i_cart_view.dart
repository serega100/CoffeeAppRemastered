import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/cart/cart_item.dart';

abstract class ICartView {
  set cartHolder(CartHolder holder);
  void showRemovedNotification(CartItem item);
}