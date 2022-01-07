import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/cart/cart_item.dart';
import 'package:coffee_app_remastered/presenter/cart/i_cart_presenter.dart';
import 'package:coffee_app_remastered/view/components/cart/cart_item_container.dart';
import 'package:coffee_app_remastered/view/components/cart/go_checkout_button.dart';
import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:coffee_app_remastered/view/pages/cart/empty_cart_page.dart';
import 'package:coffee_app_remastered/view/pages/cart/i_cart_view.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget implements INavigationBarPage {
  @override
  final NavigationIcon icon;
  @override
  final String label;

  final ICartPresenter presenter; // todo make final and non-null

  const CartPage({
    required this.icon,
    required this.label,
    required this.presenter,
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
    widget.presenter.view = this;
  }

  @override
  set cartHolder(CartHolder holder) {
    setState(() {
      _holder = holder;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_holder == null) return const EmptyCartPage();
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: ViewSettings.pageMargin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle("Корзина"),
                Wrap(
                  runSpacing: 15,
                  children: _getContainers(
                      items: _holder!.getItems(),
                      onRemoved: widget.presenter.onItemRemoved),
                  // children: [
                  //   CartItemContainer(
                  //     onRemoved: () => print("removed"),
                  //     item: CartItem(
                  //       product: Product(
                  //         id: Id(sourceId: "test", value: 0),
                  //         title: "Американо",
                  //         category: Category(
                  //             id: Id(sourceId: "test", value: 1),
                  //             title: "Кофе"),
                  //         volume: 250,
                  //         volumeUnits: VolumeUnits.grams,
                  //         price: 200,
                  //         image: Image.asset("assets/test/americano.jpg").image,
                  //       ),
                  //     ),
                  //   ),
                  // ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GoCheckoutButton(
            sumText: _holder!.stringSum,
            onPressed: widget.presenter.onCheckoutPressed,
          ),
        ),
      ],
    );
  }

  List<CartItemContainer> _getContainers({
    required List<CartItem> items,
    required void Function(CartItem) onRemoved,
  }) {
    return items
        .map(
          (item) =>
              CartItemContainer(item: item, onRemoved: () => onRemoved(item)),
        )
        .toList();
  }
}
