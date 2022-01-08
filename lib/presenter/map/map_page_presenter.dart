import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/model/map/location.dart';
import 'package:coffee_app_remastered/model/map/personal_map_holder.dart';
import 'package:coffee_app_remastered/presenter/map/i_map_presenter.dart';
import 'package:coffee_app_remastered/presenter/map/user_location_manager.dart';
import 'package:coffee_app_remastered/view/pages/map/i_map_view.dart';

class MapPagePresenter implements IMapPresenter {
  final Future<AddressHolder> _addressHolderFuture;
  final Future<PersonalMapHolder> _personalHolderFuture;

  late AddressHolder _addressHolder;
  late PersonalMapHolder _personalHolder;
  late IMapView _view;

  final _userLocationManager = UserLocationManager();

  @override
  Location defaultLocation =
      Location(latitude: 56.8319362, longitude: 60.609593);

  MapPagePresenter({
    required Future<AddressHolder> addressHolderFuture,
    required Future<PersonalMapHolder> personalHolderFuture,
  })  : _addressHolderFuture = addressHolderFuture,
        _personalHolderFuture = personalHolderFuture;

  @override
  void onPressAddress(Address address) {
    _view.showLocation(address.location);
  }

  @override
  void onSelectAddress(Address selectedAddress) {
    _personalHolder.selectedAddressId = selectedAddress.id;
    _view.updatePersonalMapHolder();
  }

  @override
  void onUnselectAddress(Address address) {
    _personalHolder.selectedAddressId = null;
    _view.updatePersonalMapHolder();
  }

  @override
  set mapView(IMapView view) {
    _view = view;

    _addressHolderFuture.then((holder) {
      _addressHolder = holder;
      _updateDistances().then((success) {
        _view.addressHolder = _addressHolder;
      });
    });

    _userLocationManager.getUserLocation().then((loc) {
      if (loc != null) {
        _view.showLocation(loc);
      }
    });

    _personalHolderFuture.then((holder) {
      _personalHolder = holder;
      _view.personalMapHolder = holder;
    });
  }

  Future<bool> _updateDistances() async {
    var userLoc = await _userLocationManager.getUserLocation();
    if (userLoc != null) {
      _addressHolder
          .setDistances((address) => address.location.getDistanceTo(userLoc));
      return true;
    }
    return false;
  }
}
