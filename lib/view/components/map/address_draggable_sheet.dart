import 'package:coffee_app_remastered/presenter/map/address/address.dart';
import 'package:coffee_app_remastered/view/components/map/address_container.dart';
import 'package:coffee_app_remastered/view/components/map/sheet_line.dart';
import 'package:coffee_app_remastered/view/components/map/shimmer_address_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressDraggableSheet extends StatelessWidget {
  final List<Address>? addressList;
  final Function(Address) onAddressPressed;
  final Function(Address) onAddressSelected;

  const AddressDraggableSheet({
    required this.addressList,
    required this.onAddressPressed,
    required this.onAddressSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                left: 0.0, top: 5.0, right: 0.0, bottom: 10.0),
            child: Column(
              children: [
                const SheetLine(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: (addressList == null) ?
                    _getShimmerSheetContents() :
                    _createSheetContents(addressList!),
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<Widget> _createSheetContents(List<Address> addressList) {
    var contents = <Widget>[];
    assert(addressList.isNotEmpty);

    for (var address in addressList) {
      contents.add(_createContainer(address));
    }

    return contents;
  }

  AddressContainer _createContainer(Address address) {
    return AddressContainer(
      address: address,
      onPressed: onAddressPressed,
      onSelected: onAddressSelected,
    );
  }

  List<Widget> _getShimmerSheetContents() {
    return <Widget>[
      const ShimmerAddressContainer(),
      const ShimmerAddressContainer(),
      const ShimmerAddressContainer(),
      const ShimmerAddressContainer(),
    ];
  }
}
