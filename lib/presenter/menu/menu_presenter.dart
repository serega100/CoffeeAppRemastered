import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/cart/cart_item.dart';
import 'package:coffee_app_remastered/model/menu_holder.dart';
import 'package:coffee_app_remastered/model/product/product.dart';
import 'package:coffee_app_remastered/presenter/menu/i_menu_presenter.dart';
import 'package:coffee_app_remastered/view/pages/menu/i_menu_view.dart';

class MenuPresenter implements IMenuPresenter {
  final Future<MenuHolder> _menuHolderFuture;
  final Future<CartHolder> _cartHolderFuture;

  late IMenuView _view;

  MenuPresenter({
    required Future<MenuHolder> menuHolderFuture,
    required Future<CartHolder> cartHolderFuture,
  })  : _menuHolderFuture = menuHolderFuture,
        _cartHolderFuture = cartHolderFuture;

  @override
  set menuView(IMenuView view) {
    _view = view;
    _menuHolderFuture.then((holder) {
      view.menuHolder = holder;
    });
  }

  @override
  void onProductAdded(Product product) {
    _cartHolderFuture.then((holder) {
      holder.addItem(CartItem(product: product));
      _view.showAddedNotification(product);
    });
  }
}
