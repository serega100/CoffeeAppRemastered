import 'package:coffee_app_remastered/model/cart/cart_item.dart';
import 'package:coffee_app_remastered/view/components/cart/remove_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemContainer extends StatelessWidget {
  final CartItem item;
  final void Function() onRemoved;

  const CartItemContainer({
    required this.item,
    required this.onRemoved,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Row(
                    children: [
                      Image(
                          image: item.product.image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product.title,
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              item.product.volumeString,
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Color(0xFF868686),
                              ),
                            ),
                            Spacer(),
                            Text(
                              item.product.priceString,
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 17.5),
          ],
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: RemoveButton(onPressed: onRemoved),
          ),
        ),
      ],
    );
  }
}
