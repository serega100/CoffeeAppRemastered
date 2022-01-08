import 'package:coffee_app_remastered/data/id.dart';

import 'address.dart';

class AddressHolder {
  List<Address> _list;
  bool _isDistanced = false;

  AddressHolder(List<Address> list) : _list = list;

  List<Address> get list => _list;

  bool get isDistanced => _isDistanced;

  Address? getAddressById(Id<Address> id) {
    for (var address in _list) {
      if (address.id == id) {
        return address;
      }
    }
    return null;
  }

  void setDistances(double Function(Address) distanceFunction) {
    for (var address in _list) {
      var distance = distanceFunction(address);
      address.distance = distance;
    }
    _sortByDistance();
    _isDistanced = true;
  }

  void _sortByDistance() {
    if (isDistanced) {
      _list.sort((address1, address2) =>
          address1.distance!.compareTo(address2.distance!));
    }
  }

  Address? getNearOpenedAddress() {
    for (var address in _list) {
      if (address.openingHours.isOpened) {
        return address;
      }
    }
    return null;
  }
}
