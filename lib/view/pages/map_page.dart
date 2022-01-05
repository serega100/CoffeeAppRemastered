import 'dart:async';

import 'package:coffee_app_remastered/presenter/map/address/address.dart';
import 'package:coffee_app_remastered/presenter/map/map_page_presenter.dart';
import 'package:coffee_app_remastered/view/components/map/address_draggable_sheet.dart';
import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget implements INavigationBarPage {
  final MapPagePresenter presenter;
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

class _MapPageState extends State<MapPage> {
  var _initilized = false;
  var _addressesLoaded = false;

  late final List<Address> _addressList;
  final Completer<GoogleMapController> _mapControllerHolder = Completer();

  void _init() {
    widget.presenter.getAddressList().then((adrList) {
      setState(() {
        _addressList = adrList;
        _addressesLoaded = true;
      });
    });

    widget.presenter.getUserLocation().then((userLoc) {
      if (userLoc != null) {
        _mapControllerHolder.future.then((controller) {
          controller.moveCamera(CameraUpdate.newLatLng(
              LatLng(userLoc.latitude, userLoc.longitude)
          ));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initilized) {
      _initilized = true;
      _init();
    }

    return Stack(
      children: [
        GoogleMap(
          compassEnabled: false,
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
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
          addressList: (_addressesLoaded) ? _addressList : null,
          onAddressPressed: (address) =>
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Tap on ${address.title}'),
          )),
          onAddressSelected: (address) =>
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Select ${address.title}'),
          )),
        ),
      ],
    );
  }

  CameraPosition _getDefaultCameraPosition(double zoom) {
    var defaultLoc = widget.presenter.getDefaultLocation();
    var latitude = defaultLoc.latitude;
    var longitude = defaultLoc.longitude;
    return CameraPosition(target: LatLng(latitude, longitude), zoom: zoom);
  }
}
