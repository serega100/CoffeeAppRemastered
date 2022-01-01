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
    return GestureDetector(
      onTap: widget.onTap,
      child: Center(
        child: Icon(Icons.add_box, color: Color(0xFF6B453C), size: 40.0),
      )
    );
  }
}
