import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/cart/cart_item.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/presenter/cart/i_cart_presenter.dart';
import 'package:coffee_app_remastered/presenter/checkout/i_checkout_presenter_creator.dart';
import 'package:coffee_app_remastered/view/components/cart/cart_item_container.dart';
import 'package:coffee_app_remastered/view/components/cart/go_checkout_button.dart';
import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/components/page_title.dart';
import 'package:coffee_app_remastered/view/pages/cart/empty_cart_page.dart';
import 'package:coffee_app_remastered/view/pages/cart/i_cart_view.dart';
import 'package:coffee_app_remastered/view/pages/checkout/checkout_route.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:coffee_app_remastered/view/view_utils.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget implements INavigationBarPage {
  @override
  final NavigationIcon icon;
  @override
  final String label;

  final ICartPresenter cartPresenter;
  final ICheckoutPresenterCreator checkoutPresenterCreator;

  const CartPage({
    required this.icon,
    required this.label,
    required this.cartPresenter,
    required this.checkoutPresenterCreator,
    Key? key,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();

  @override
  Widget getAsWidget() => this;

  @override
  Color? get navigationCornerColor => null;
}

class _CartPageState extends State<CartPage> implements ICartView {
  CartHolder? _holder;

  @override
  void initState() {
    widget.cartPresenter.view = this;
  }

  @override
  set cartHolder(CartHolder holder) {
    setState(() {
      _holder = holder;
    });
  }

  @override
  void showRemovedNotification(CartItem item) {
    ViewUtils.showDefaultSnackBarMessage(
        context, "Продукт \"${item.product.title}\" удален из Корзины");
  }

  @override
  void showCheckout(CartHolder holder, AddressHolder addressHolder, Address address) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckoutRoute(
        presenter: widget.checkoutPresenterCreator.create(holder, addressHolder, address),
      )),
    );
  }

  @override
  void showNoAddressesMessage() {
    ViewUtils.showFailSnackBarMessage(
      context,
      "К сожалению, все наши заведения уже закрыты",
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_holder == null) return Container();
    if (_holder!.getItems().isEmpty) return const EmptyCartPage();
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: ViewSettings.pageMargin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle("Корзина"),
                Column(
                  children: [
                    Wrap(
                      runSpacing: 15,
                      children: _getContainers(
                          items: _holder!.getItems(),
                          onRemoved: widget.cartPresenter.onItemRemoved),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GoCheckoutButton(
            sumText: _holder!.stringSum,
            onPressed: widget.cartPresenter.onCheckoutPressed,
          ),
        ),
      ],
    );
  }

  List<CartItemContainer> _getContainers({
    required List<CartItem> items,
    required void Function(int) onRemoved,
  }) {
    var containers = <CartItemContainer>[];
    var i = 0;
    for (var item in items) {
      var itemId = i;
      containers.add(
          CartItemContainer(item: item, onRemoved: () => onRemoved(itemId)));
      i++;
    }
    return containers;
  }
}
