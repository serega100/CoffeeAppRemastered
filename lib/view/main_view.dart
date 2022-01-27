import 'package:coffee_app_remastered/view/components/navigation/rounded_navigation_bar.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  final List<INavigationBarPage> navigationPages;
  final _pageController = PageController();

  MainView({
    required this.navigationPages,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: navigationPages.map((p) => p.getAsWidget()).toList(),
        ),
      ),
      backgroundColor: ViewSettings.pageBackgroundColor,
      bottomNavigationBar: RoundedNavigationBar(
        unselectedItemColor: ViewSettings.unselectedColor,
        selectedItemColor: ViewSettings.selectedColor,
        pages: navigationPages,
        onPageChanged: _onPageChanged,
      ),
    );
  }

  void _onPageChanged(INavigationBarPage newPage) {
    final newPageNumber = navigationPages.indexOf(newPage);
    _pageController.animateToPage(
        newPageNumber, duration: const Duration(milliseconds: 500),
        curve: Curves.ease);
  }
}
