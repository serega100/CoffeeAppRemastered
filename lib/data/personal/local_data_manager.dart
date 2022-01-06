import 'dart:async';

import 'package:coffee_app_remastered/data/personal/i_personal_data_manager.dart';
import 'package:coffee_app_remastered/model/cart_holder.dart';
import 'package:coffee_app_remastered/model/map/personal_map_holder.dart';
import 'package:coffee_app_remastered/model/menu_holder.dart';
import 'package:localstorage/localstorage.dart';

class LocalDataManager implements IPersonalDataManager {
  static const fileName = "local_data.json";
  static const cartHolderStorageId = "card_holder";
  static const personalMapHolderStorageId = "personal_map_holder";

  final storage = LocalStorage(fileName);

  @override
  Future<CartHolder> getCartHolderFuture(Future<MenuHolder> menuFuture) async {
    var menu = await menuFuture;
    var json = storage.getItem(cartHolderStorageId);
    return CartHolder.fromLocalJson(
      menu: menu,
      dataManager: this,
      json: json,
    );
  }

  @override
  Future<PersonalMapHolder> getPersonalMapHolderFuture() async {
    var json = storage.getItem(personalMapHolderStorageId);
    return PersonalMapHolder.fromLocalJson(dataManager: this, json: json);
  }

  @override
  Future<void> setCartHolder(CartHolder holder) async {
    storage.setItem(cartHolderStorageId, holder.toLocalJson());
  }

  @override
  Future<void> setPersonalMapHolder(PersonalMapHolder holder) async {
    storage.setItem(personalMapHolderStorageId, holder.toLocalJson());
  }
}
