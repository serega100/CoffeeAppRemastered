import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget implements INavigationBarPage {
  @override
  final NavigationIcon icon;
  @override
  final String label;

  const CartPage({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();

  @override
  Widget getAsWidget() => this;

  @override
  Color? get navigationCornerColor => null;
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ViewSettings.pageMargin,
      child: Column(
        children: [
          PageTitle("Корзина"),

        ],
      ),
    );
  }
}
