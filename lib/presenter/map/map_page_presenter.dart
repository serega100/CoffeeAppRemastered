import 'package:coffee_app_remastered/data/id.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/model/map/address/address_state.dart';
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
    _addressHolder.selected = selectedAddress;
    _view.updateAddressHolder();
  }

  @override
  set mapView(IMapView view) {
    _view = view;

    _addressHolderFuture.then((value) {
      _updateDistances().then((success) {
        if (success) _addressHolder.sortByDistance();
        _view.addressHolder = _addressHolder;
      });
    });

    _userLocationManager.getUserLocation().then((loc) {
      if (loc != null) {
        _view.showLocation(loc);
      }
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

  Future<void> _loadAddressHolder() async {
    await Future.delayed(const Duration(seconds: 3)); // todo debug
    _addressHolder = AddressHolder(<Address>[
      Address(
        id: Id(sourceId: "test", value: 0),
        title: "ул. Малышева д. 113",
        subtitle: "г. Екатеринбург",
        location: Location(
          latitude: 56.839821,
          longitude: 60.645451,
        ),
        state: AddressState.opened,
        endStateTime: DateTime(1, 1, 1, 23, 0),
      ),
      Address(
        id: Id(sourceId: "test", value: 1),
        title: "ул. Мира д. 19 (этаж 1)",
        subtitle: "г. Екатеринбург",
        location: Location(
          latitude: 56.84392,
          longitude: 60.65391,
        ),
        state: AddressState.opened,
        endStateTime: DateTime(1, 1, 1, 23, 0),
      ),
      Address(
        id: Id(sourceId: "test", value: 2),
        title: "просп. Ленина, д. 36",
        subtitle: "г. Екатеринбург",
        location: Location(
          latitude: 56.83859219356317,
          longitude: 60.609320334756056,
        ),
        state: AddressState.opened,
        endStateTime: DateTime(1, 1, 1, 23, 0),
      ),
    ]);
  }
}
