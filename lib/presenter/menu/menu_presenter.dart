import 'package:coffee_app_remastered/model/cart_holder.dart';
import 'package:coffee_app_remastered/model/menu_holder.dart';
import 'package:coffee_app_remastered/model/product/product.dart';
import 'package:coffee_app_remastered/presenter/menu/i_menu_presenter.dart';
import 'package:coffee_app_remastered/view/pages/menu/i_menu_view.dart';

class MenuPresenter implements IMenuPresenter {
  final Future<MenuHolder> _menuHolderFuture;
  final Future<CartHolder> _cartHolderFuture;

  late IMenuView _view;
  late MenuHolder? _menuHolder;
  late CartHolder? _cartHolder;

  MenuPresenter({
    required Future<MenuHolder> menuHolderFuture,
    required Future<CartHolder> cartHolderFuture,
  })  : _menuHolderFuture = menuHolderFuture,
        _cartHolderFuture = cartHolderFuture;

  @override
  set menuView(IMenuView view) {
    _view = view;
    _menuHolderFuture.then((holder) {
      _menuHolder = holder;
      view.menuHolder = holder;
    });
    _cartHolderFuture.then((holder) {
      _cartHolder = holder;
    });
  }

  @override
  void onProductAdded(Product product) {
    // todo implement
    // _cartHolder!.addItem(product);
  }
}
