import 'package:coffee_app_remastered/presenter/map/map_page_presenter.dart';
import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/main_view.dart';
import 'package:coffee_app_remastered/view/pages/cart_page.dart';
import 'package:coffee_app_remastered/view/pages/discounts_page.dart';
import 'package:coffee_app_remastered/view/pages/home_page.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/pages/map_page.dart';
import 'package:coffee_app_remastered/view/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const CoffeeApp());
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
