import 'package:coffee_app_remastered/model/cart_holder.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/model/menu_holder.dart';

abstract class IDataManager {
  Future<MenuHolder> get menuHolderFuture;
  Future<AddressHolder> get addressHolderFuture;
  Future<CartHolder> get cartHolderFuture;
  // todo split on personal and general data
}