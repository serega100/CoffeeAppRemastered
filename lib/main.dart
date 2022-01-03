import 'package:coffee_app_remastered/presenter/map/map_page_presenter.dart';
import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/components/navigation/page_icon_holder.dart';
import 'package:coffee_app_remastered/view/main_view.dart';
import 'package:coffee_app_remastered/view/pages/cart_page.dart';
import 'package:coffee_app_remastered/view/pages/discounts_page.dart';
import 'package:coffee_app_remastered/view/pages/home_page.dart';
import 'package:coffee_app_remastered/view/pages/map_page.dart';
import 'package:coffee_app_remastered/view/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const CoffeeApp());
}

final _homePage = HomePage();
final _discountsPage = DiscountsPage();
final _menuPage = MenuPage();
final _mapPage = MapPage(presenter: MapPagePresenter());
final _cartPage = CartPage();

final _pages = <PageIconHolder>[
  PageIconHolder(_homePage, const NavigationIcon(Icons.home)),
  PageIconHolder(_discountsPage, const NavigationIcon(Icons.local_activity)),
  PageIconHolder(_menuPage, const NavigationIcon(Icons.menu)),
  PageIconHolder(_mapPage, const NavigationIcon(Icons.map)),
  PageIconHolder(_cartPage, const NavigationIcon(Icons.shopping_cart)),
];

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      home: MainView(
        pages: _pages
      ),
    );
  }
}
