import 'package:coffee_app_remastered/model/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'checkout_container.dart';

class OrderCheckoutContainer extends StatelessWidget {
  final List<CartItem> items;

  const OrderCheckoutContainer({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckoutContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 10, bottom: 10),
              child:
                  Text("Ваш заказ:", style: GoogleFonts.montserrat(fontSize: 18)),
            ),
            _generateItemsWrap(items),
          ],
        ),
      ),
    );
  }

  Widget _generateItemsWrap(List<CartItem> items) {
    var widgets = <Widget>[_ItemContainer(item: items[0])];
    for (var item in items.skip(1)) {
      widgets.add(SizedBox(height: 10));
      widgets.add(Container(
        color: const Color(0xFFC4C4C4),
        height: 1,
      ));
      widgets.add(SizedBox(height: 10));
      widgets.add(_ItemContainer(item: item));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widgets,
    );
  }
}

class _ItemContainer extends StatelessWidget {
  final CartItem item;

  const _ItemContainer({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image(
              width: 50,
              height: 50,
              image: item.product.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.product.title,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              Text(item.product.volumeString,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: const Color(0xFF868686),
                  )),
            ],
          ),
          Spacer(),
          Text(item.product.priceString,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
