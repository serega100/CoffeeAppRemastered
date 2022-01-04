import 'package:flutter/material.dart';

class NavigationIcon extends StatelessWidget {
  final Widget _widget;

  NavigationIcon(IconData icon, {Key? key})
      : _widget = Icon(icon, size: 30.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _widget;
  }
}
