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
  @override
  Widget build(BuildContext context) {
    var initLoc = widget.presenter.getInitialLocation();
    return Stack(
      children: [
        GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(initLoc.latitude, initLoc.longitude),
                zoom: 14.0)),
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
          futureAddressList: widget.presenter.getAddressList(),
          onAddressPressed: (address) => {},
          onAddressSelected: (address) => {},
        ),
      ],
    );
  }
}
