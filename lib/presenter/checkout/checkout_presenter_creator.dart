import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/presenter/checkout/checkout_presenter.dart';
import 'package:coffee_app_remastered/presenter/checkout/i_checkout_presenter.dart';
import 'package:coffee_app_remastered/presenter/checkout/i_checkout_presenter_creator.dart';

class CheckoutPresenterCreator implements ICheckoutPresenterCreator {
  @override
  ICheckoutPresenter create(CartHolder cartHolder, AddressHolder addressHolder, Address address) {
    return CheckoutPresenter(cartHolder: cartHolder, addressHolder: addressHolder, address: address);
  }
}
