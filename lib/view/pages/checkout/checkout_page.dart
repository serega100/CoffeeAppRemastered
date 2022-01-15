import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/presenter/checkout/i_checkout_presenter.dart';
import 'package:coffee_app_remastered/view/components/bottom_sheet/address_bottom_sheet.dart';
import 'package:coffee_app_remastered/view/components/checkout/checkout_container.dart';
import 'package:coffee_app_remastered/view/components/checkout/order_checkout_container.dart';
import 'package:coffee_app_remastered/view/components/checkout/pay_button.dart';
import 'package:coffee_app_remastered/view/components/page_title.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'i_checkout_view.dart';

class CheckoutPage extends StatefulWidget {
  final ICheckoutPresenter presenter;

  const CheckoutPage({
    required this.presenter,
    Key? key,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> implements ICheckoutView {
  late Address _selectedAddress;
  late AddressHolder _addressHolder;
  late CartHolder _cartHolder;
  bool _isAddressSheetShowing = false;

  @override
  void initState() {
    widget.presenter.view = this;
  }

  @override
  set selectedAddress(Address address) {
    setState(() {
      _selectedAddress = address;
    });
  }

  @override
  set addressHolder(AddressHolder holder) {
    setState(() {
      _addressHolder = holder;
    });
  }

  @override
  set cartHolder(CartHolder holder) {
    setState(() {
      _cartHolder = holder;
    });
  }

  @override
  void showAddressBar(AddressHolder addressHolder) {
    setState(() {
      _isAddressSheetShowing = true;
    });
    print("Address bar showed");
  }

  @override
  void hideAddressBar() {
    setState(() {
      _isAddressSheetShowing = false;
    });
    print("Address bar hidden");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: ViewSettings.pageMargin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PageTitle(
                  "Заказ",
                  backButton: BackButton(
                    color: ViewSettings.secondColor,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Wrap(
                  runSpacing: 15,
                  children: [
                    CheckoutContainer(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: widget.presenter.onAddressBarOpen,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, bottom: 20, right: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text("Пункт получения:",
                                      style:
                                          GoogleFonts.montserrat(fontSize: 18)),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  flex: 5,
                                  child: Text(_selectedAddress.title,
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(Icons.edit),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    OrderCheckoutContainer(
                      items: _cartHolder.getItems(),
                    ),
                    CheckoutContainer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Row(
                          children: [
                            Text("К оплате:",
                                style: GoogleFonts.montserrat(fontSize: 18)),
                            Spacer(),
                            Text(
                              _cartHolder.stringSum,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: PayButton(onPressed: widget.presenter.onPayButtonPressed),
        ),
        if (_isAddressSheetShowing)
          GestureDetector(
              onTap: widget.presenter.onAddressBarClosed,
              child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Container(color: Colors.black.withOpacity(0.5)))),
        if (_isAddressSheetShowing)
          AddressBottomSheet.unselectable(
            addressList: _addressHolder.list,
            onAddressPressed: widget.presenter.onAddressChanged,
            selectedAddressId: _selectedAddress.id,
          )
      ],
    );
  }
}
