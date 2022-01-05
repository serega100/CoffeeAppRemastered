import 'package:coffee_app_remastered/view/components/shimmer_box.dart';
import 'package:flutter/material.dart';

class ShimmerCategoryContainer extends StatelessWidget {
  const ShimmerCategoryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerBox(height: 24),
        SizedBox(height: 20),
        Wrap(
          runSpacing: 20.0,
          children: _getShimmerProductContainers(3),
        ),
      ],
    );
  }

  List<Widget> _getShimmerProductContainers(int count) {
    var containers = <Widget>[];
    for (int i = 0; i < count; i++) {
      containers.add(Padding(
        padding: const EdgeInsets.only(),
        child: Row(
          children: [
            ShimmerBox(
              width: 80,
              height: 80,
              borderRadius: BorderRadius.circular(10),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
      ));
    }

    return containers;
  }
}
