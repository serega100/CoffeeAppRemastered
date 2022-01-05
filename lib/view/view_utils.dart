import 'package:coffee_app_remastered/model/product/volume_units.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewUtils {
  static String beautifyPrice(double price) {
    const vault = "₽";
    var strNumber =
        price.toStringAsFixed(price.truncateToDouble() == price ? 0 : 2);
    return strNumber + " " + vault;
  }

  static String beautifyDistance(double meters) {
    final mFormat = NumberFormat("###");
    final kmFormat = NumberFormat("#####.0");
    const m = "м";
    const km = "км";

    if (meters < 1000) {
      var mStr = mFormat.format(meters);
      return "$mStr $m";
    } else {
      var kilometers = meters / 1000;
      var kmStr = kmFormat.format(kilometers);
      return "$kmStr $km";
    }
  }

  static String beautifyVolume(double volume, VolumeUnits units) {
    var strUnit = "";
    switch (units) {
      case VolumeUnits.grams:
        strUnit = "г";
        break;
      case VolumeUnits.ml:
        strUnit = "мл";
        break;
    }

    final floatFormat = NumberFormat("######.00");
    final intFormat = NumberFormat("######");

    if (volume.floorToDouble() == volume) {
      return "${intFormat.format(volume)} $strUnit";
    } else {
      return "${floatFormat.format(volume)} $strUnit";
    }
  }

  static void showSnackBarSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ViewSettings.successColor,
      content: Text(message),
    ));
  }

  static void showSnackBarFailMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ViewSettings.failColor,
      content: Text(message),
    ));
  }
}
