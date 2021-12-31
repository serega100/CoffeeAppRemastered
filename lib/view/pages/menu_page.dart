import 'package:flutter/material.dart';

import 'i_page.dart';

class MenuPage extends StatelessWidget implements IPage {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Menu Page")
    );
  }

  @override
  Widget getAsWidget() => this;
}
