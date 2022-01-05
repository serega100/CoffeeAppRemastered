import 'package:coffee_app_remastered/presenter/map/address/address.dart';
import 'package:coffee_app_remastered/presenter/map/address/address_state.dart';
import 'package:coffee_app_remastered/view/components/map/select_button.dart';
import 'package:coffee_app_remastered/view/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddressContainer extends StatefulWidget {
  final Address address;
  final void Function(Address) onPressed;
  final void Function(Address) onSelected;

  static const padding = EdgeInsets.symmetric(vertical: 10, horizontal: 15);

  const AddressContainer({
    required this.address,
    required this.onPressed,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  _AddressContainerState createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => widget.onPressed(widget.address),
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
                      widget.address.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.address.subtitle,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    _AddressStateWidget(
                      state: widget.address.state,
                      endTime: widget.address.endStateTime,
                    )
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SelectButton(
                      selected: widget.address.isSelected,
                      onSelected: () => widget.onSelected(widget.address),
                    ),
                    const SizedBox(height: 5),
                    if (widget.address.distance != null)
                      Text(
                        ViewUtils.beautifyDistance(widget.address.distance!),
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
  final hourMinuteFormat = DateFormat('HH:mm');

  final AddressState state;
  final DateTime endTime;

  _AddressStateWidget({
    required this.state,
    required this.endTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case AddressState.opened:
        return Text(
          "Открыто до ${hourMinuteFormat.format(endTime)}",
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF868686),
          ),
        );
      case AddressState.closed:
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
                  text: " • Откроется в ${hourMinuteFormat.format(endTime)}",
                ),
              ]),
        );
      default:
        throw Exception("State $state can't be handled by AddressStateWidget");
    }
  }
}
