import 'package:coffee_app_remastered/view/components/home/big_home_container.dart';
import 'package:coffee_app_remastered/view/components/home/small_home_container.dart';
import 'package:coffee_app_remastered/view/components/page_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final pageMargin = const EdgeInsets.only(left: 15, right: 15, bottom: 20);
  final titleMargin = const EdgeInsets.only(top: 15, bottom: 15, left: 5);
  final containerMargin = const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0);

  final verticalContainerMargin = 5.0;
  final horizontalContainerMargin = 5.0;

  double getSmallContainerWidth(double screenWidth) {
    var margins = pageMargin.left + pageMargin.right + containerMargin.vertical * 2;
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
            child: Wrap(
              children: [
                PageTitle("Добрый день", margin: widget.titleMargin),
                BigHomeContainer(
                  title: "Первый кофе бесплатно",
                  actionText: "Акция доступна для вас",
                  backgroundImage:
                      Image.asset("assets/test/coffee_cup_on_table.jpg"),
                  margin: EdgeInsets.only(
                      bottom: widget.horizontalContainerMargin),
                ),
                SmallHomeContainer(
                  title: "Айс-крим-брод за 69 руб",
                  actionText: "Успей до 26 ноября",
                  backgroundImage:
                      Image.asset("assets/test/coffee_cup_on_table.jpg"),
                  margin: EdgeInsets.only(
                      top: widget.horizontalContainerMargin,
                      right: widget.verticalContainerMargin,
                      bottom: widget.horizontalContainerMargin),
                  width: smallContainerWidth,
                ),

                PageTitle("Это интересно", margin: widget.titleMargin),
                BigHomeContainer(
                  title: "Первый кофе бесплатно",
                  actionText: "Акция доступна для вас",
                  backgroundImage:
                      Image.asset("assets/test/coffee_cup_on_table.jpg"),
                  margin: EdgeInsets.only(
                      bottom: widget.horizontalContainerMargin),
                ),
                SmallHomeContainer(
                  title: "Айс-крим-брод за 69 руб",
                  actionText: "Успей до 26 ноября",
                  backgroundImage:
                      Image.asset("assets/test/coffee_cup_on_table.jpg"),
                  margin: EdgeInsets.only(
                      top: widget.horizontalContainerMargin,
                      right: widget.verticalContainerMargin,
                      bottom: widget.horizontalContainerMargin),
                  width: smallContainerWidth,
                ),
                SmallHomeContainer(
                  title: "Айс-крим-брод за 69 руб",
                  backgroundImage:
                      Image.asset("assets/test/coffee_cup_on_table.jpg"),
                  margin: EdgeInsets.only(
                      top: widget.horizontalContainerMargin,
                      left: widget.verticalContainerMargin,
                      bottom: widget.horizontalContainerMargin),
                  width: smallContainerWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
