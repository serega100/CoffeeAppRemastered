import 'address.dart';

class AddressHolder {
  List<Address> _list;
  Address? _selected;
  bool _isDistanced = false;

  AddressHolder(List<Address> list)
      : _list = list,
        _selected = _getSelected(list);

  List<Address> get list => _list;

  bool get isDistanced => _isDistanced;

  Address? get selected => _selected;

  static Address? _getSelected(List<Address> list) {
    Address? selected;
    for (var address in list) {
      if (address.isSelected) {
        if (selected != null) throw ManySelectedException();
        selected = address;
      }
    }
    return selected;
  }

  set selected(Address? address) {
    for (var addr in list) {
      addr.isSelected = false;
    }
    if (address != null) {
      address.isSelected = true;
    }
    _selected = address;
  }

  void setDistances(double Function(Address) distanceFunction) {
    for (var address in _list) {
      var distance = distanceFunction(address);
      address.distance = distance;
    }
    _isDistanced = true;
  }

  void sortByDistance() {
    _list.sort((address1, address2) =>
        address1.distance!.compareTo(address2.distance!));
  }
}

class ManySelectedException implements Exception {}
