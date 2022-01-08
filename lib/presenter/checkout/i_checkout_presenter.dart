import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/view/pages/checkout/i_checkout_view.dart';

abstract class ICheckoutPresenter {
  set view(ICheckoutView view);

  void onAddressBarOpen();
  void onAddressChanged(Address newAddress);
  void onPayButtonPressed();
}