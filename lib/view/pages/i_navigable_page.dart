import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:flutter/material.dart';

import 'i_page.dart';

abstract class INavigationBarPage extends IPage {
  /// Sets custom color for corner of navigation bar
  /// Return null to set default corner color
  Color? get navigationCornerColor;

  NavigationIcon get icon;

  String get label;
}