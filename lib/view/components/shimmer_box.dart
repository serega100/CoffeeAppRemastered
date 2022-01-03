import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShimmerBox extends StatelessWidget {
  final double? width;
  final double? height;

  const ShimmerBox({this.width, this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.black.withOpacity(0.04),
      ),
    );
  }
}
