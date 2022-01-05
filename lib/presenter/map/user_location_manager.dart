import 'package:coffee_app_remastered/model/map/location.dart';
import 'package:geolocator/geolocator.dart';

import 'location_permission_manager.dart';

class UserLocationManager {
  final permissionManager = LocationPermissionManager();

  /// Returns user location or null if it's the permission is denied
  Future<Location?> getUserLocation() async {
    bool permissionGranted = false;
    await permissionManager.request(
      onPermanentlyDenied: () {
      },
      onGranted: () {
        permissionGranted = true;
      },
    );

    if (permissionGranted) {
      var pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      var userLoc = Location(latitude: pos.latitude, longitude: pos.longitude);
      return userLoc;
    } else {
      return null;
    }
  }
}