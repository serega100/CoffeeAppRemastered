import 'package:coffee_app_remastered/model/product/product.dart';
import 'package:coffee_app_remastered/view/pages/menu/i_menu_view.dart';

abstract class IMenuPresenter {
  set menuView(IMenuView view);

  void onProductAdded(Product product);
}