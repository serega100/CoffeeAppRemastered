import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/location.dart';
import 'package:coffee_app_remastered/view/pages/i_map_view.dart';

abstract class IMapPresenter {
  set mapView(IMapView view);
  Location get defaultLocation;

  void onSelectAddress(Address address);
  void onPressAddress(Address address);
}