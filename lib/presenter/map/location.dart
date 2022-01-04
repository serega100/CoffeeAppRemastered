import 'package:geolocator/geolocator.dart';

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude
  });

  Future<double> getDistanceToUser() async {
    Location userLoc = await getUserLocation();
    return getDistanceTo(userLoc);
  }

  /// Get distance between this and other locations in meters
  double getDistanceTo(Location other) {
    return Geolocator.distanceBetween(
        latitude, longitude, other.latitude, other.longitude);
  }

  static Future<Location> getUserLocation() async {
    var pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    var userLoc = Location(latitude: pos.latitude, longitude: pos.longitude);
    return userLoc;
  }
}
