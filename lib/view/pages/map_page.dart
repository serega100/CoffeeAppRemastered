import 'package:flutter/material.dart';

import 'i_page.dart';

class MapPage extends StatelessWidget implements IPage {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Map Page")
    );
  }

  @override
  Widget getAsWidget() => this;
}
