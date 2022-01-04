import 'package:coffee_app_remastered/presenter/map/address/address.dart';
import 'package:coffee_app_remastered/view/components/map/address_container.dart';
import 'package:coffee_app_remastered/view/components/map/sheet_line.dart';
import 'package:coffee_app_remastered/view/components/map/shimmer_address_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressDraggableSheet extends StatefulWidget {
  final Future<List<Address>> futureAddressList;
  final Function(Address) onAddressPressed;
  final Function(Address) onAddressSelected;

  const AddressDraggableSheet({
    required this.futureAddressList,
    required this.onAddressPressed,
    required this.onAddressSelected,
    Key? key,
  }) : super(key: key);

  @override
  _AddressDraggableSheetState createState() => _AddressDraggableSheetState();
}

class _AddressDraggableSheetState extends State<AddressDraggableSheet> {
  late final List<Address> addressList;
  var _isLoaded = false;

  @override
  Widget build(BuildContext context) {
    widget.futureAddressList.then((addressList) {
      addressList = addressList;
      setState(() {
        _isLoaded = true;
      });
    });

    return DraggableScrollableSheet(
        minChildSize: 0.2,
        maxChildSize: 0.5,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, -1), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.only(
                left: 15.0, top: 5.0, right: 15.0, bottom: 10.0),
            child: Column(
              children: [
                const SheetLine(),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: (!_isLoaded) ?
                    _getShimmerSheetContents(spacing: 20) :
                    _createSheetContents(addressList, spacing: 20),
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<Widget> _createSheetContents(List<Address> addressList,
      {double? spacing}) {
    var contents = <Widget>[];
    assert(addressList.isNotEmpty);

    contents.add(_createContainer(addressList[0]));
    for (var address in addressList.skip(1)) {
      if (spacing != null) contents.add(SizedBox(height: spacing));
      contents.add(_createContainer(address));
    }

    return contents;
  }

  AddressContainer _createContainer(Address address) {
    return AddressContainer(
      address: address,
      onPressed: widget.onAddressPressed,
      onSelected: widget.onAddressSelected,
    );
  }

  List<Widget> _getShimmerSheetContents({double? spacing}) {
    return <Widget>[
      const ShimmerAddressContainer(),
      SizedBox(height: spacing,),
      const ShimmerAddressContainer(),
      SizedBox(height: spacing,),
      const ShimmerAddressContainer(),
      SizedBox(height: spacing,),
      const ShimmerAddressContainer(),
    ];
  }
}
