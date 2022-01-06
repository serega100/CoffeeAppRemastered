import 'package:coffee_app_remastered/data/id.dart';
import 'package:coffee_app_remastered/model/map/address/oppening_hours.dart';
import 'package:coffee_app_remastered/model/map/location.dart';

class Address {
  final Id<Address> id;
  final String title;
  final String subtitle;
  final Location location;
  final OpeningHours openingHours;
  double? distance;

  Address({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.openingHours,
    this.distance,
  });
}
