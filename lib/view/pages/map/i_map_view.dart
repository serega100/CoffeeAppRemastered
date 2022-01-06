import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/model/map/location.dart';
import 'package:coffee_app_remastered/model/map/personal_map_holder.dart';

abstract class IMapView {
  set addressHolder(AddressHolder address);
  set personalMapHolder(PersonalMapHolder address);

  updateAddressHolder();
  updatePersonalMapHolder();

  showLocation(Location location);
  showSelectedNotification(Address address);
}