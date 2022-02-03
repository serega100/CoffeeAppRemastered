import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/oppening_hours.dart';
import 'package:coffee_app_remastered/view/components/bottom_sheet/select_button.dart';
import 'package:coffee_app_remastered/view/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressContainer extends StatelessWidget {
  final Address address;
  final void Function(Address) onPressed;
  final void Function(Address)? onSelected;
  final bool selectable;
  final bool selected;

  static const padding = EdgeInsets.symmetric(vertical: 10, horizontal: 15);

  const AddressContainer.selectable({
    required this.address,
    required this.onPressed,
    required Function(Address) onSelected,
    required this.selected,
    Key? key,
  })  : selectable = true,
        this.onSelected = onSelected,
        super(key: key);

  const AddressContainer.unselectable({
    required this.address,
    required this.onPressed,
    required this.selected,
    Key? key,
  })  : selectable = false,
        onSelected = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onPressed(address),
        child: Container(
          padding: AddressContainer.padding,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: 5),
                    Text(
                      address.subtitle,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(height: 5),
                    _AddressStateWidget(
                      openingHours: address.openingHours,
                    )
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (selected || selectable)
                    Column(
                      children: [
                        SelectButton(
                          selected: selected,
                          onSelected: () => onSelected!(address),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                    Spacer(),
                    if (address.distance != null)
                      Text(
                        ViewUtils.beautifyDistance(address.distance!),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF868686),
                        ),
                      )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddressStateWidget extends StatelessWidget {
  final OpeningHours openingHours;

  _AddressStateWidget({
    required this.openingHours,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (openingHours.isOpened) {
      return Text(
        "Открыто до ${openingHours.closeTimeString}",
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF868686),
        ),
      );
    } else {
      return RichText(
        text: TextSpan(
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF868686),
            ),
            children: <TextSpan>[
              const TextSpan(
                  text: "Закрыто",
                  style: TextStyle(
                    color: Color(0xFFC0392B),
                  )),
              TextSpan(
                text: " • Откроется в ${openingHours.openTimeString}",
              ),
            ]),
      );
    }
  }
}
