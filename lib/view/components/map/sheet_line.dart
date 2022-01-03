import 'package:flutter/material.dart';

class SheetLine extends StatelessWidget {
  const SheetLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFC4C4C4),
            borderRadius: BorderRadius.circular(1)),
        width: 100,
        height: 3,
      ),
    );
  }
}
