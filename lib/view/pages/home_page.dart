import 'package:coffee_app_remastered/view/components/home/big_home_container.dart';
import 'package:coffee_app_remastered/view/components/home/small_home_container.dart';
import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final pageMargin = const EdgeInsets.only(left: 15, right: 15, bottom: 20);
  final titleMargin = const EdgeInsets.only(top: 20, bottom: 20, left: 5);

  final verticalContainerSpacing = 10.0;
  final horizontalContainerSpacing = 10.0;

  double getSmallContainerWidth(double screenWidth) {
    var margins = pageMargin.left + pageMargin.right + horizontalContainerSpacing;
    return (screenWidth - margins) / 2;
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final smallContainerWidth = widget.getSmallContainerWidth(screenWidth);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: widget.pageMargin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle("Добрый день", margin: widget.titleMargin),
                Wrap(
                    spacing: widget.horizontalContainerSpacing,
                    runSpacing: widget.verticalContainerSpacing,
                    children: [
                      BigHomeContainer(
                        title: "Первый кофе бесплатно",
                        actionText: "Акция доступна для вас",
                        backgroundImage:
                            Image.asset("assets/test/coffee_cup_on_table.jpg"),
                      ),
                      SmallHomeContainer(
                        title: "Айс-крим-брод за 69 руб",
                        actionText: "Успей до 26 ноября",
                        backgroundImage:
                            Image.asset("assets/test/coffee_cup_on_table.jpg"),
                        width: smallContainerWidth,
                      ),
                    ]),
                PageTitle("Это интересно", margin: widget.titleMargin),
                Wrap(
                  spacing: widget.horizontalContainerSpacing,
                  runSpacing: widget.verticalContainerSpacing,
                  children: [
                    BigHomeContainer(
                      title: "Первый кофе бесплатно",
                      actionText: "Акция доступна для вас",
                      backgroundImage:
                          Image.asset("assets/test/coffee_cup_on_table.jpg"),
                    ),
                    SmallHomeContainer(
                      title: "Айс-крим-брод за 69 руб",
                      actionText: "Успей до 26 ноября",
                      backgroundImage:
                          Image.asset("assets/test/coffee_cup_on_table.jpg"),
                      width: smallContainerWidth,
                    ),
                    SmallHomeContainer(
                      title: "Айс-крим-брод за 69 руб",
                      backgroundImage:
                          Image.asset("assets/test/coffee_cup_on_table.jpg"),
                      width: smallContainerWidth,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
