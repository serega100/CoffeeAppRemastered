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
    final kmFormat = NumberFormat("####.0");
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
}