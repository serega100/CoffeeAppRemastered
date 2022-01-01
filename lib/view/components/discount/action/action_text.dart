import 'package:coffee_app_remastered/view/components/discount/action/i_discount_action.dart';
import 'package:coffee_app_remastered/view/components/discount/discount_container_typography.dart';
import 'package:flutter/material.dart';

class DiscountActionText extends StatelessWidget implements IDiscountAction {
  final String text;

  const DiscountActionText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DiscountContainerActionText(text);
  }

  @override
  Widget get widget => this;
}
