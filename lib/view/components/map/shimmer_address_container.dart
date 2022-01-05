import 'package:coffee_app_remastered/view/components/shimmer_box.dart';
import 'package:flutter/material.dart';

class ShimmerAddressContainer extends StatelessWidget {
  static const shimmerWidth = 200.0;
  static const padding = EdgeInsets.symmetric(vertical: 10, horizontal: 15);

  const ShimmerAddressContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ShimmerAddressContainer.padding,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ShimmerBox(
                width: shimmerWidth,
              ),
              SizedBox(height: 4),
              ShimmerBox(
                  width: shimmerWidth,
              ),
              SizedBox(height: 4),
              ShimmerBox(
                width: shimmerWidth,
              )
            ],
          ),
        ],
      ),
    );
  }
}
