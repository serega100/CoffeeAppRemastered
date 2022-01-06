import 'package:coffee_app_remastered/data/general/i_general_data_manager.dart';
import 'package:coffee_app_remastered/model/cart_holder.dart';
import 'package:coffee_app_remastered/model/map/personal_map_holder.dart';

abstract class IPersonalDataManager {
  Future<CartHolder> get cartHolderFuture;
  Future<PersonalMapHolder> get personalMapHolderFuture;
  // todo add discount personal models

  set generalDataManager(IGeneralDataManager dataManager);
  set cartHolder(CartHolder holder);
  set personalMapHolder(PersonalMapHolder holder);
}