import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/cart/cart_item.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';

abstract class ICartView {
  set cartHolder(CartHolder holder);

  void showRemovedNotification(CartItem item);
  void showCheckout(CartHolder holder, AddressHolder addressHolder, Address address);
  void showNoAddressesMessage();
}