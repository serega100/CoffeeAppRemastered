import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:flutter/material.dart';

import 'i_page.dart';

class MapPage extends StatefulWidget implements IPage {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();

  @override
  Widget getAsWidget() => this;
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageTitle("Карты"),
      ],
    );
  }
}

