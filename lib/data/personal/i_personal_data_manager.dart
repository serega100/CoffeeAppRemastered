import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/map/personal_map_holder.dart';
import 'package:coffee_app_remastered/model/menu_holder.dart';

abstract class IPersonalDataManager {
  Future<CartHolder> getCartHolderFuture(Future<MenuHolder> menuHolderFuture);
  Future<PersonalMapHolder> getPersonalMapHolderFuture();
  // todo add discount personal models

  Future<void> setCartHolder(CartHolder holder);
  Future<void> setPersonalMapHolder(PersonalMapHolder holder);
}