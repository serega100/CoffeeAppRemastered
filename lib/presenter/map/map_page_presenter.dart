import 'package:coffee_app_remastered/presenter/map/address/address_state.dart';
import 'package:coffee_app_remastered/presenter/map/location.dart';

import 'address/address.dart';

class MapPagePresenter {
  // todo make async loading with shimmer effect in view
  Location getInitialLocation() {
    var ekbCenter = Location(latitude: 56.8319362, longitude: 60.609593);
    return ekbCenter;
  }

  // todo make async loading with shimmer effect in view
  Future<List<Address>> getAddressList() async {
    await Future.delayed(Duration(seconds: 3));
    return <Address>[
      Address(
        title: "ул. Малышева д. 113",
        subtitle: "г. Екатеринбург",
        location: Location(
          latitude: 56.839821,
          longitude: 60.645451,
        ),
        state: AddressState.opened,
        endStateTime: DateTime(1, 1, 1, 23, 0),
        isSelected: true,
      ),
      Address(
        title: "ул. Мира д. 19 (этаж 1)",
        subtitle: "г. Екатеринбург",
        location: Location(
          latitude: 56.84392,
          longitude: 60.65391,
        ),
        state: AddressState.opened,
        endStateTime: DateTime(1, 1, 1, 23, 0),
        isSelected: false,
      ),
      Address(
        title: "просп. Ленина, д. 36",
        subtitle: "г. Екатеринбург",
        location: Location(
          latitude: 56.83859219356317,
          longitude: 60.609320334756056,
        ),
        state: AddressState.opened,
        endStateTime: DateTime(1, 1, 1, 23, 0),
        isSelected: false,
      ),
    ];
  }
}
