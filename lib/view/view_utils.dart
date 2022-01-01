class ViewUtils {
  static String beautifyPrice(double price) {
    var vault = "₽";
    var strNumber =
    price.toStringAsFixed(price.truncateToDouble() == price ? 0 : 2);
    return strNumber + " " + vault;
  }
}