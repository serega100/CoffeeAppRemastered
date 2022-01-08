import 'package:coffee_app_remastered/data/general/contentful_data_manager.dart';
import 'package:coffee_app_remastered/data/general/i_general_data_manager.dart';
import 'package:coffee_app_remastered/data/personal/i_personal_data_manager.dart';
import 'package:coffee_app_remastered/data/personal/local_data_manager.dart';
import 'package:coffee_app_remastered/presenter/cart/cart_presenter.dart';
import 'package:coffee_app_remastered/presenter/checkout/checkout_presenter_creator.dart';
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

final IPersonalDataManager personalData = LocalDataManager();
final IGeneralDataManager generalData = ContentfulDataManager();

final menuHolderFuture = generalData.menuHolderFuture;
final cartHolderFuture = personalData.getCartHolderFuture(menuHolderFuture);
final addressHolderFuture = generalData.addressHolderFuture;
final personalMapHolderFuture = personalData.getPersonalMapHolderFuture();

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
    presenter: MenuPresenter(
      menuHolderFuture: menuHolderFuture,
      cartHolderFuture: cartHolderFuture,
    ),
  ),
  MapPage(
    icon: NavigationIcon(Icons.map),
    label: "Карта",
    presenter: MapPagePresenter(
      addressHolderFuture: addressHolderFuture,
      personalHolderFuture: personalMapHolderFuture,
    ),
  ),
  CartPage(
    icon: NavigationIcon(Icons.shopping_cart),
    label: "Корзина",
    cartPresenter: CartPresenter(
      cartHolderFuture: cartHolderFuture,
      addressHolderFuture: addressHolderFuture,
      personalMapHolderFuture: personalMapHolderFuture,
    ),
    checkoutPresenterCreator: CheckoutPresenterCreator(),
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
