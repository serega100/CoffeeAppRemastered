import 'package:coffee_app_remastered/view/components/discount/i_discount_container.dart';

abstract class IDiscountWrap {
  String getTitle();
  List<IDiscountContainer> getContainers();
  void setTitle(String title);
  void setContainers(List<IDiscountContainer> containers);
}