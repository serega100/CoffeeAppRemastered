import 'package:coffee_app_remastered/view/components/menu/product_container.dart';
import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'i_page.dart';

class MenuPage extends StatefulWidget implements IPage {
  const MenuPage({Key? key}) : super(key: key);

  final pageMargin = const EdgeInsets.only(left: 15, right: 15, bottom: 20);
  final titleMargin = const EdgeInsets.only(top: 20, bottom: 20, left: 5);

  final verticalContainerSpacing = 10.0;

  @override
  _MenuPageState createState() => _MenuPageState();

  @override
  Widget getAsWidget() => this;
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: widget.pageMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PageTitle("Меню", margin: widget.titleMargin),
            Wrap(
              runSpacing: 20.0,
              children: [
                ProductContainer(
                  image:  NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/coffee-app-fffa9.appspot.com/o/product_images%2Famericano.jpg?alt=media&token=c882bc6d-561d-4b50-9be6-73568871030f"),
                  title: "Американо",
                  volume: "250 г",
                  price: 200.0,
                ),
                ProductContainer(
                  image:  NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/coffee-app-fffa9.appspot.com/o/product_images%2Famericano.jpg?alt=media&token=c882bc6d-561d-4b50-9be6-73568871030f"),
                  title: "Американо",
                  volume: "250 г",
                  price: 200.0,
                ),
                ProductContainer(
                  image:  NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/coffee-app-fffa9.appspot.com/o/product_images%2Famericano.jpg?alt=media&token=c882bc6d-561d-4b50-9be6-73568871030f"),
                  title: "Американо",
                  volume: "250 г",
                  price: 200.0,
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}

