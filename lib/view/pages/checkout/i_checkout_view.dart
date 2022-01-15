import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';

abstract class ICheckoutView {
  set cartHolder(CartHolder holder);
  set addressHolder(AddressHolder holder);
  set selectedAddress(Address address);

  void showAddressBar(AddressHolder addressHolder);
  void hideAddressBar();
}