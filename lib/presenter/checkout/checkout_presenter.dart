import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/presenter/checkout/i_checkout_presenter.dart';
import 'package:coffee_app_remastered/view/pages/checkout/i_checkout_view.dart';

class CheckoutPresenter implements ICheckoutPresenter {
  final AddressHolder addressHolder;
  final CartHolder cartHolder;
  Address address;

  late ICheckoutView _view;

  CheckoutPresenter({
    required this.cartHolder,
    required this.addressHolder,
    required this.address,
  });

  @override
  void onAddressBarOpen() {
    _view.showAddressBar(addressHolder);
  }

  @override
  void onAddressBarClosed() {
    _view.hideAddressBar();
  }

  @override
  void onAddressChanged(Address currentAddress) {
    address = currentAddress;
    _view.selectedAddress = address;
    onAddressBarClosed();
  }

  @override
  void onPayButtonPressed() {
    // TODO: implement onPayButtonPressed
    print("Pay button pressed");
  }

  @override
  set view(ICheckoutView view) {
    _view = view;
    view.addressHolder = addressHolder;
    view.selectedAddress = address;
    view.cartHolder = cartHolder;
  }
}