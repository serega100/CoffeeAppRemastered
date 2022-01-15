import 'package:coffee_app_remastered/data/id.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/view/components/bottom_sheet/address_container.dart';
import 'package:coffee_app_remastered/view/components/bottom_sheet/sheet_line.dart';
import 'package:coffee_app_remastered/view/components/bottom_sheet/shimmer_address_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressBottomSheet extends StatelessWidget {
  final List<Address>? addressList;
  final bool selectable;
  final Function(Address) onAddressPressed;
  final Function(Address)? onAddressSelected;
  final Function(Address)? onAddressUnselected;
  final Id<Address>? selectedAddressId;
  final bool showClosed;

  const AddressBottomSheet.selectable({
    required this.addressList,
    required this.onAddressPressed,
    required Function(Address) onAddressSelected,
    required Function(Address) onAddressUnselected,
    required this.selectedAddressId,
    this.showClosed = true,
    Key? key,
  })  : selectable = true,
        this.onAddressSelected = onAddressSelected,
        this.onAddressUnselected = onAddressUnselected,
        super(key: key);

  const AddressBottomSheet.unselectable({
    required this.addressList,
    required this.onAddressPressed,
    required this.selectedAddressId,
    this.showClosed = false,
    Key? key,
  })  : onAddressSelected = null,
        onAddressUnselected = null,
        selectable = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        minChildSize: 0.2,
        maxChildSize: 0.5,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
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
                    children: (addressList == null)
                        ? _getShimmerContainers(4)
                        : _createSheetContents(addressList!, selectedAddressId),
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<Widget> _createSheetContents(
      List<Address> addressList, Id<Address>? selectedId) {
    var contents = <Widget>[];
    assert(addressList.isNotEmpty);

    for (var address in addressList) {
      var selected = (selectedId != null) && (address.id == selectedId);
      if (selectable) {
        contents.add(_createSelectableContainer(address, selected));
      } else {
        contents.add(_createUnselectableContainer(address, selected));
      }
    }

    return contents;
  }

  AddressContainer _createSelectableContainer(Address address, bool selected) {
    return AddressContainer.selectable(
      address: address,
      onPressed: onAddressPressed,
      onSelected: (!selected) ? onAddressSelected! : onAddressUnselected!,
      selected: selected,
    );
  }

  AddressContainer _createUnselectableContainer(Address address, bool selected) {
    return AddressContainer.unselectable(
      address: address,
      onPressed: onAddressPressed,
      selected: selected,
    );
  }

  List<ShimmerAddressContainer> _getShimmerContainers(int count) {
    var list = <ShimmerAddressContainer>[];
    for (int i = 0; i < count; i++) {
      list.add(const ShimmerAddressContainer());
    }
    return list;
  }
}
