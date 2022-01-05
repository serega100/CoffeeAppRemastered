import 'package:coffee_app_remastered/presenter/map/location_permission_manager.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  static final permissionManager = LocationPermissionManager();

  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  /// Returns distance between this and user location or null
  /// if it's the permission is denied
  Future<double?> getDistanceToUser() async {
    var userLoc = await getUserLocation();
    if (userLoc == null) return null;
    return getDistanceTo(userLoc);
  }

  /// Get distance between this and other locations in meters
  double getDistanceTo(Location other) {
    return Geolocator.distanceBetween(
        latitude, longitude, other.latitude, other.longitude);
  }

  /// Returns user location or null if it's the permission is denied
  static Future<Location?> getUserLocation() async {
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
