import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/model/map/location.dart';

abstract class IMapView {
  set addressHolder(AddressHolder address);
  updateAddressHolder();
  showLocation(Location location);
  showSelectedNotification(Address address);
}