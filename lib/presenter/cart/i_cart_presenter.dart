import 'package:coffee_app_remastered/model/cart/cart_item.dart';
import 'package:coffee_app_remastered/view/pages/cart/i_cart_view.dart';

abstract class ICartPresenter {
  set view(ICartView view);

  void onItemRemoved(CartItem item);
  void onCheckoutPressed();
}