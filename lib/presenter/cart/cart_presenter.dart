import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/presenter/cart/i_cart_presenter.dart';
import 'package:coffee_app_remastered/view/pages/cart/i_cart_view.dart';

class CartPresenter implements ICartPresenter {
  final Future<CartHolder> _cartHolderFuture;
  late ICartView _view;

  CartPresenter({
    required Future<CartHolder> cartHolderFuture,
  }) : _cartHolderFuture = cartHolderFuture;

  @override
  void onCheckoutPressed() {
    // TODO: implement onCheckoutPressed
  }

  @override
  void onItemRemoved(int itemId) {
    _cartHolderFuture.then((holder) {
      var removedItem = holder.getItemById(itemId);
      holder.removeItem(itemId);
      _view.cartHolder = holder;
      _view.showRemovedNotification(removedItem);
    });
  }

  @override
  set view(ICartView view) {
    _view = view;
    _cartHolderFuture.then((holder) {
      view.cartHolder = holder;
    });
  }
}
