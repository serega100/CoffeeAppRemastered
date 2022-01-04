import 'package:coffee_app_remastered/view/components/navigation/navigation_bar.dart';
import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  final List<INavigationBarPage> navigationPages;

  MainView({
    required this.navigationPages,
    Key? key,
  }) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late INavigationBarPage _currentPage = widget.navigationPages[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _currentPage.getAsWidget()),
      backgroundColor: ViewSettings.pageBackgroundColor,
      bottomNavigationBar: NavigationBar(
        unselectedItemColor: ViewSettings.unselectedColor,
        selectedItemColor: ViewSettings.selectedColor,
        pages: widget.navigationPages,
        onPageChanged: _onPageChanged,
      ),
    );
  }

  void _onPageChanged(INavigationBarPage newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }
}
