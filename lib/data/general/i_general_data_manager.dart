import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/model/menu_holder.dart';

abstract class IGeneralDataManager {
  Future<MenuHolder> get menuHolderFuture;
  Future<AddressHolder> get addressHolderFuture;

  // todo add home page and discounts
}