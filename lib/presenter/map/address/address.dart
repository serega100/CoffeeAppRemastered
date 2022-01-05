import 'package:coffee_app_remastered/presenter/map/address/address_state.dart';
import 'package:coffee_app_remastered/presenter/map/location.dart';

class Address {
  final String title;
  final String subtitle;
  final Location location;
  final double? distance;
  AddressState _state;
  DateTime _endStateTime;
  bool _isSelected;

  Address._({
    required this.title,
    required this.subtitle,
    required this.location,
    required this.distance,
    required AddressState state,
    required DateTime endStateTime,
    required bool isSelected,
  })  : _state = state,
        _endStateTime = endStateTime,
        _isSelected = isSelected;

  static Future<Address> create({
    required String title,
    required String subtitle,
    required Location location,
    required AddressState state,
    required DateTime endStateTime,
    required bool isSelected,
  }) async {
    var distance = await location.getDistanceToUser();
    return Address._(
      title: title,
      subtitle: subtitle,
      location: location,
      distance: distance,
      state: state,
      endStateTime: endStateTime,
      isSelected: isSelected,
    );
  }

  AddressState get state => _state;
  DateTime get endStateTime => _endStateTime;
  bool get isSelected => _isSelected;

  set isSelected(bool value) {
    _isSelected = value;
  }
}
