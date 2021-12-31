import 'package:flutter/material.dart';

import 'i_page.dart';

class CartPage extends StatelessWidget implements IPage {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Cart Page")
    );
  }

  @override
  Widget getAsWidget() => this;
}
