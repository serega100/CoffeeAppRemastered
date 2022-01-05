import 'package:coffee_app_remastered/view/components/shimmer_box.dart';
import 'package:flutter/material.dart';

class ShimmerAddressContainer extends StatelessWidget {
  static const padding = EdgeInsets.symmetric(vertical: 10, horizontal: 15);

  const ShimmerAddressContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ShimmerAddressContainer.padding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                ShimmerBox(height: 18),
                SizedBox(height: 5),
                ShimmerBox(height: 18),
                SizedBox(height: 5),
                ShimmerBox(height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
