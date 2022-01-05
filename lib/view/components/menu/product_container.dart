import 'package:coffee_app_remastered/view/view_utils.dart';
import 'package:flutter/material.dart';

import 'add_product_button.dart';

class ProductContainer extends StatefulWidget {
  final ImageProvider image;
  final String title;
  final String volumeString;
  final double price;
  final void Function() onAdded;

  ProductContainer({
    required this.image,
    required this.title,
    required this.volumeString,
    required this.price,
    required this.onAdded,
    Key? key
  }) : super(key: key);

  @override
  _ProductContainerState createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            width: 80,
            height: 80,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Text(widget.volumeString, style: TextStyle(fontSize: 14, color: Color(0xFF868686)),),
              Padding(padding: EdgeInsets.symmetric(vertical: 5.0),),
              Text(ViewUtils.beautifyPrice(widget.price), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ],
          ),
          Spacer(),
          AddProductButton(onTap: () => {}),
        ],
      ),
    );
  }
}
