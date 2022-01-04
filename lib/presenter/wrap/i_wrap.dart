import 'package:coffee_app_remastered/presenter/wrap/i_container.dart';

abstract class IWrap {
  String get title;
  List<IContainer> get containers;
}