import 'package:coffee_app_remastered/presenter/checkout/i_checkout_presenter.dart';
import 'package:coffee_app_remastered/view/pages/checkout/checkout_page.dart';
import 'package:flutter/material.dart';

class CheckoutRoute extends StatelessWidget {
  final ICheckoutPresenter presenter;

  const CheckoutRoute({
    required this.presenter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CheckoutPage(
          presenter: presenter,
        ),
      ),
    );
  }
}
