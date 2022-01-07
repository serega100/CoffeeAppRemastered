import 'package:coffee_app_remastered/model/menu_holder.dart';
import 'package:coffee_app_remastered/model/product/product.dart';
import 'package:coffee_app_remastered/presenter/menu/i_menu_presenter.dart';
import 'package:coffee_app_remastered/view/components/menu/category_container.dart';
import 'package:coffee_app_remastered/view/components/menu/shimmer_category_container.dart';
import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/pages/menu/i_menu_view.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:coffee_app_remastered/view/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget implements INavigationBarPage {
  @override
  final NavigationIcon icon;
  @override
  final String label;

  final IMenuPresenter presenter;

  const MenuPage({
    required this.icon,
    required this.label,
    required this.presenter,
    Key? key,
  }) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();

  @override
  Widget getAsWidget() => this;

  @override
  Color? get navigationCornerColor => null;
}

class _MenuPageState extends State<MenuPage> implements IMenuView {
  MenuHolder? _menuHolder;

  @override
  void initState() {
    widget.presenter.menuView = this;
  }

  @override
  set menuHolder(MenuHolder menuHolder) {
    _menuHolder = menuHolder;
    updateMenuHolder();
  }

  @override
  updateMenuHolder() {
    setState(() {
      // pass nothing
    });
  }

  @override
  void showAddedNotification(Product product) {
    var msg = "Товар \"${product.title}\" добавлен в корзину";
    ViewUtils.showSuccessSnackBarMessage(context, msg);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: ViewSettings.pageMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PageTitle("Меню"),
            Wrap(
              runSpacing: 30.0,
              children: (_menuHolder != null)
                  ? _getCategoryContainers()
                  : _getShimmerContainers(3),
            )
          ],
        ),
      ),
    );
  }

  List<CategoryContainer> _getCategoryContainers() {
    var containers = <CategoryContainer>[];
    for (var category in _menuHolder!.getCategories()) {
      var productList = _menuHolder!.getProducts(category);
      containers.add(CategoryContainer(
        category: category,
        products: productList,
        onProductAdded: widget.presenter.onProductAdded,
      ));
    }
    return containers;
  }

  List<ShimmerCategoryContainer> _getShimmerContainers(int count) {
    var containers = <ShimmerCategoryContainer>[];
    for (int i = 0; i < count; i++) {
      containers.add(const ShimmerCategoryContainer());
    }
    return containers;
  }
}
