import 'package:coffee_app_remastered/view/components/discount/action/i_discount_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../discount_container_typography.dart';

class PriceDiscountAction extends StatelessWidget implements IDiscountAction {
  String? actionText;
  String priceString;

  PriceDiscountAction({this.actionText, required this.priceString, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          if (actionText != null) DiscountContainerActionText(actionText!),
          Spacer(),
          Text(priceString,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        ],
      ),
    );
  }

  @override
  Widget get widget => this;
}
