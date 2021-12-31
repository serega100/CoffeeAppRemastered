import 'package:coffee_app_remastered/view/pages/i_page.dart';
import 'package:flutter/material.dart';

class DiscountsPage extends StatelessWidget implements IPage {
  const DiscountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Discounts Page"),
    );
  }

  @override
  Widget getAsWidget() => this;
}
