import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

class AddProductButton extends StatefulWidget {
  final void Function() onTap;

  const AddProductButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _AddProductButtonState createState() => _AddProductButtonState();
}

class _AddProductButtonState extends State<AddProductButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Container(
        width: 35,
        height: 35,
        color: ViewSettings.secondColor,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            child: const Center(
              child: Icon(Icons.add, color: Colors.white, size: 30.0),
            ),
          ),
        ),
      ),
    );
  }
}
