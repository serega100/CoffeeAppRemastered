import 'dart:async';

import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/model/map/location.dart';
import 'package:coffee_app_remastered/model/map/personal_map_holder.dart';
import 'package:coffee_app_remastered/presenter/map/i_map_presenter.dart';
import 'package:coffee_app_remastered/view/components/map/address_draggable_sheet.dart';
import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:coffee_app_remastered/view/pages/map/i_map_view.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:coffee_app_remastered/view/view_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget implements INavigationBarPage {
  final IMapPresenter presenter;
  @override
  final NavigationIcon icon;
  @override
  final String label;

  const MapPage({
    required this.presenter,
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();

  @override
  Widget getAsWidget() => this;

  @override
  Color? get navigationCornerColor => Colors.white;
}

class _MapPageState extends State<MapPage> implements IMapView {
  AddressHolder? _addressHolder;
  PersonalMapHolder? _personalMapHolder;

  var _markers = <Marker>{};
  final Completer<GoogleMapController> _mapControllerHolder = Completer();

  @override
  void initState() {
    widget.presenter.mapView = this;
  }

  @override
  set addressHolder(AddressHolder addressHolder) {
    _addressHolder = addressHolder;
    updateAddressHolder();
  }

  @override
  updateAddressHolder() {
    setState(() {
      _markers = _createMarkers(_addressHolder!.list);
    });
  }

  @override
  set personalMapHolder(PersonalMapHolder holder) {
    _personalMapHolder = holder;
    updatePersonalMapHolder();
  }

  @override
  updatePersonalMapHolder() {
    setState(() {
      // do nothing
    });
  }

  @override
  showLocation(Location location) {
    _mapControllerHolder.future.then((controller) {
      controller.animateCamera(CameraUpdate.newLatLng(_toLatLng(location)));
    });
  }

  @override
  showSelectedNotification(Address address) {
    var msg = "Теперь ${address.title} ваш избранный ресторан";
    ViewUtils.showSnackBarSuccessMessage(context, msg);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          compassEnabled: false,
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: _markers,
          initialCameraPosition: _getDefaultCameraPosition(14.00),
          onMapCreated: (mapController) {
            _mapControllerHolder.complete(mapController);
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: ViewSettings.pageMargin.copyWith(bottom: 0),
              child: PageTitle("Карта"),
            ),
          ],
        ),
        AddressDraggableSheet(
          addressList: _addressHolder?.list,
          onAddressPressed: widget.presenter.onPressAddress,
          onAddressSelected: widget.presenter.onSelectAddress,
          onAddressUnselected: widget.presenter.onUnselectAddress,
          selectedAddressId: _personalMapHolder?.selectedAddressId,
        ),
      ],
    );
  }

  CameraPosition _getDefaultCameraPosition(double zoom) {
    var defaultLoc = widget.presenter.defaultLocation;
    var latitude = defaultLoc.latitude;
    var longitude = defaultLoc.longitude;
    return CameraPosition(target: LatLng(latitude, longitude), zoom: zoom);
  }

  Set<Marker> _createMarkers(List<Address> addressList) {
    var markers = <Marker>{};
    for (var address in addressList) {
      markers.add(Marker(
        markerId: MarkerId(address.title),
        position: _toLatLng(address.location),
      ));
    }
    return markers;
  }

  LatLng _toLatLng(Location loc) {
    return LatLng(loc.latitude, loc.longitude);
  }
}
