import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/presenter/checkout/i_checkout_presenter.dart';

abstract class ICheckoutPresenterCreator {
  ICheckoutPresenter create(CartHolder holder, AddressHolder addressHolder, Address address);
}