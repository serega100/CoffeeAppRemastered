import 'package:coffee_app_remastered/view/components/discount/action/action_text.dart';
import 'package:coffee_app_remastered/view/components/discount/action/progress_action.dart';
import 'package:coffee_app_remastered/view/components/discount/action/price_action.dart';
import 'package:coffee_app_remastered/view/components/discount/big_discount_container.dart';
import 'package:coffee_app_remastered/view/components/discount/small_discount_container.dart';
import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/components/page_title.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:coffee_app_remastered/view/view_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget implements INavigationBarPage {
  @override
  final NavigationIcon icon;
  @override
  final String label;

  const HomePage({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  final verticalContainerSpacing = 10.0;
  final horizontalContainerSpacing = 10.0;

  double getSmallContainerWidth(double screenWidth) {
    var pageMargin = ViewSettings.pageMargin;
    var margins =
        pageMargin.left + pageMargin.right + horizontalContainerSpacing;
    return (screenWidth - margins) / 2;
  }

  @override
  _HomePageState createState() => _HomePageState();

  @override
  Widget getAsWidget() => this;

  @override
  Color? get navigationCornerColor => null;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final smallContainerWidth = widget.getSmallContainerWidth(screenWidth);

    return SingleChildScrollView(
      child: Container(
        margin: ViewSettings.pageMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle("Добрый день"),
            Wrap(
                spacing: widget.horizontalContainerSpacing,
                runSpacing: widget.verticalContainerSpacing,
                children: [
                  BigDiscountContainer(
                    title: "Первый кофе бесплатно",
                    action: DiscountActionText("Акция доступна для вас"),
                    backgroundImage:
                        Image.asset("assets/test/coffee_cup_on_table.jpg"),
                  ),
                  SmallDiscountContainer(
                    title: "Шестой кофе бесплатно",
                    action: DiscountProgressAction(4, 6),
                    backgroundImage: Image.asset("assets/test/coffee_mug.jpg"),
                    width: smallContainerWidth,
                  ),
                  SmallDiscountContainer(
                    title: "Айс-крим-брод за 69 руб",
                    action: DiscountActionText("Успей до 26 ноября"),
                    backgroundImage:
                        Image.asset("assets/test/coffee_cup_on_table.jpg"),
                    width: smallContainerWidth,
                  ),
                  SmallDiscountContainer(
                    title: "Айс-крим-брод за 69 руб",
                    action: DiscountActionText("Успей до 26 ноября"),
                    backgroundImage:
                        Image.asset("assets/test/coffee_cup_on_table.jpg"),
                    width: smallContainerWidth,
                  ),
                  // SmallDiscountContainer(
                  //   title: "Айс-крим-брод за 69 руб",
                  //   action: DiscountActionText("Успей до 26 ноября"),
                  //   backgroundImage:
                  //       Image.asset("assets/test/coffee_cup_on_table.jpg"),
                  //   width: smallContainerWidth,
                  // ),
                ]
            ),
            PageTitle("Это интересно"),
            Wrap(
              spacing: widget.horizontalContainerSpacing,
              runSpacing: widget.verticalContainerSpacing,
              children: [
                SmallDiscountContainer(
                  title: "Первый кофе бесплатно",
                  action: PriceDiscountAction(
                    actionText: 'Новинка!',
                    priceString: ViewUtils.beautifyPrice(200),
                  ),
                  backgroundImage:
                      Image.asset("assets/test/coffee_cup_on_table.jpg"),
                  width: smallContainerWidth,
                ),
                SmallDiscountContainer(
                  title: "Первый кофе бесплатно",
                  backgroundImage:
                  Image.asset("assets/test/coffee_cup_on_table.jpg"),
                  width: smallContainerWidth,
                ),
              ],
            )
          ], // todo add big price container
        ),
      ),
    );
  }
}
