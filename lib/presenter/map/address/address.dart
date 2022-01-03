import 'package:coffee_app_remastered/presenter/map/address/address_state.dart';
import 'package:coffee_app_remastered/presenter/map/location.dart';

class Address {
  final String title;
  final String subtitle;
  final Location location;
  AddressState _state;
  DateTime _endStateTime;
  bool _isSelected;

  Address({
    required this.title,
    required this.subtitle,
    required this.location,
    required AddressState state,
    required DateTime endStateTime,
    required bool isSelected,
  })  : _state = state,
        _endStateTime = endStateTime,
        _isSelected = isSelected;

  AddressState get state => _state;
  DateTime get endStateTime => _endStateTime;
  bool get isSelected => _isSelected;

  set isSelected(bool value) {
    _isSelected = value;
  }

  Future<double> getDistance() async {
    return await location.getDistanceToUser();
  }
}
