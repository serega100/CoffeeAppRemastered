import 'package:coffee_app_remastered/view/components/discount/action/action_text.dart';
import 'package:coffee_app_remastered/view/components/discount/action/progress_action.dart';
import 'package:coffee_app_remastered/view/components/discount/big_discount_container.dart';
import 'package:coffee_app_remastered/view/components/navigation/navigation_icon.dart';
import 'package:coffee_app_remastered/view/components/page_title.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

class DiscountsPage extends StatefulWidget implements INavigationBarPage {
  @override
  final NavigationIcon icon;
  @override
  final String label;

  const DiscountsPage({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  final verticalContainerSpacing = 10.0;
  final horizontalContainerSpacing = 10.0;

  @override
  _DiscountsPageState createState() => _DiscountsPageState();

  @override
  Widget getAsWidget() => this;

  @override
  Color? get navigationCornerColor => null;
}

class _DiscountsPageState extends State<DiscountsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: ViewSettings.pageMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle("Акции"),
              Wrap(
                spacing: widget.horizontalContainerSpacing,
                runSpacing: widget.verticalContainerSpacing,
                children: [
                  BigDiscountContainer(
                    title: "Первый кофе бесплатно",
                    description:
                        "Закажи свой первый кофе через приложение и получи его бесплатно!",
                    action: DiscountActionText("Акция доступна для вас"),
                    backgroundImage:
                        Image.asset("assets/test/coffee_cup_on_table.jpg"),
                  ),
                  BigDiscountContainer(
                    title: "Шестой кофе бесплатно",
                    description:
                        "Закажите через приложение 5 чашек любого кофе и получите 6-ю за наш счёт!",
                    action: DiscountProgressAction(4, 6),
                    backgroundImage: Image.asset("assets/test/coffee_mug.jpg"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
