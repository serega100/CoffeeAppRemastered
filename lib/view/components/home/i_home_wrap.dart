import 'package:coffee_app_remastered/view/components/home/i_home_container.dart';

abstract class IHomeWrap {
  String getTitle();
  List<IHomeContainer> getContainers();
  void setTitle(String title);
  void setContainers(List<IHomeContainer> containers);
}