import 'package:geolocator/geolocator.dart';

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  /// Get distance between this and other locations in meters
  double getDistanceTo(Location other) {
    return Geolocator.distanceBetween(
        latitude, longitude, other.latitude, other.longitude);
  }
}
