import 'package:coffee_app_remastered/data/personal/i_personal_data_manager.dart';
import 'package:coffee_app_remastered/data/id.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';

class PersonalMapHolder {
  final IPersonalDataManager _dataManager;
  Id<Address>? _selectedAddressId;

  PersonalMapHolder({
    required IPersonalDataManager dataManager,
    required Id<Address> selectedAddress,
  })  : _dataManager = dataManager,
        _selectedAddressId = selectedAddress;

  Id<Address>? get selectedAddressId => _selectedAddressId;

  set selectedAddressId(Id<Address>? address) {
    _selectedAddressId = address;
    _dataManager.personalMapHolder = this;
  }
}