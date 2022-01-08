import 'package:coffee_app_remastered/data/id.dart';
import 'package:coffee_app_remastered/model/cart/cart_item.dart';
import 'package:coffee_app_remastered/model/product/category.dart';
import 'package:coffee_app_remastered/model/product/product.dart';
import 'package:coffee_app_remastered/model/product/volume_units.dart';
import 'package:coffee_app_remastered/view/components/checkout/checkout_container.dart';
import 'package:coffee_app_remastered/view/components/checkout/order_checkout_container.dart';
import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: ViewSettings.pageMargin,
        child: Column(
          children: [
            PageTitle("Заказ"),
            Wrap(
              runSpacing: 15,
              children: [
                CheckoutContainer(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text("Пункт получения:",
                                  style: GoogleFonts.montserrat(fontSize: 18)),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              flex: 5,
                              child: Text("ул. Малышева, д. 113",
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
                OrderCheckoutContainer(items: [
                  CartItem(product: Product(
                    id: Id<Product>(sourceId: 'test', value: 0),
                    title: "Американо",
                    category: Category(
                      id: Id<Category>(sourceId: 'test', value: 0),
                      title: "Кофе",
                      orderPriority: 1,
                    ),
                    volume: 200,
                    volumeUnits: VolumeUnits.ml,
                    image: Image.asset("assets/test/americano.jpg").image,
                    price: 200,
                  )),
                ],),
                CheckoutContainer(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      children: [
                        Text("К оплате:",
                            style: GoogleFonts.montserrat(fontSize: 18)),
                        Spacer(),
                        Text(
                          "600 Р",
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
            )
          ],
        ),
      ),
    );
  }
}
