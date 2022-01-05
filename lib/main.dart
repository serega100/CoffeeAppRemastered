import 'package:coffee_app_remastered/model/cart_holder.dart';
import 'package:coffee_app_remastered/model/menu_holder.dart';
import 'package:coffee_app_remastered/model/product/category.dart';
import 'package:coffee_app_remastered/model/product/product.dart';
import 'package:coffee_app_remastered/model/product/volume_units.dart';
import 'package:coffee_app_remastered/presenter/map/map_page_presenter.dart';
import 'package:coffee_app_remastered/presenter/menu/menu_presenter.dart';
import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/main_view.dart';
import 'package:coffee_app_remastered/view/pages/cart/cart_page.dart';
import 'package:coffee_app_remastered/view/pages/discounts_page.dart';
import 'package:coffee_app_remastered/view/pages/home_page.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/pages/map/map_page.dart';
import 'package:coffee_app_remastered/view/pages/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const CoffeeApp());
}

Product _getAmericano(Category category) {
  final image = Image.asset("assets/test/americano.jpg").image;
  return Product(
    title: "Американо",
    category: category,
    volume: 250,
    volumeUnits: VolumeUnits.grams,
    price: 200,
    image: image,
  );
}

Future<MenuHolder> _getTestMenuHolderFuture() async {
  await Future.delayed(const Duration(seconds: 5));
  var coffee = Category("Кофе");
  var tea = Category("Чай");
  var deserts = Category("Десерты");
  return MenuHolder({
    coffee: [_getAmericano(coffee), _getAmericano(coffee), _getAmericano(coffee)],
    tea: [_getAmericano(coffee), _getAmericano(coffee), _getAmericano(coffee)],
    deserts: [_getAmericano(coffee), _getAmericano(coffee), _getAmericano(coffee)],
  });
}

Future<CartHolder> _getTestCartHolderFuture() async {
  await Future.delayed(const Duration(seconds: 3));
  return CartHolder([]);
}

final _pages = <INavigationBarPage>[
  HomePage(
    icon: NavigationIcon(Icons.home),
    label: "Главная",
  ),
  DiscountsPage(
    icon: NavigationIcon(Icons.local_activity),
    label: "Акции",
  ),
  MenuPage(
    icon: NavigationIcon(Icons.menu),
    presenter: MenuPresenter(
      menuHolderFuture: _getTestMenuHolderFuture(),
      cartHolderFuture: _getTestCartHolderFuture(),
    ),
    label: "Меню",
  ),
  MapPage(
    icon: NavigationIcon(Icons.map),
    presenter: MapPagePresenter(),
    label: "Карта",
  ),
  CartPage(
    icon: NavigationIcon(Icons.shopping_cart),
    label: "Корзина",
  ),
];

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      home: MainView(navigationPages: _pages),
    );
  }
}
