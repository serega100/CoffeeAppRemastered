import 'package:coffee_app_remastered/view/components/map/address_draggable_sheet.dart';
import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'i_page.dart';

class MapPage extends StatefulWidget implements IPage {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();

  @override
  Widget getAsWidget() => this;
}

class _MapPageState extends State<MapPage> {
  static const _ekbCenter = CameraPosition(
    target: LatLng(56.8319362, 60.609593),
    zoom: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () async {
    //   _showBottomSheet();
    // });
    return Stack(
      children: [
        GoogleMap(initialCameraPosition: _ekbCenter),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: ViewSettings.pageMargin.copyWith(bottom: 0),
              child: PageTitle("Карта"),
            ),
          ],
        ),
        AddressDraggableSheet(),
      ],
    );
  }
}
