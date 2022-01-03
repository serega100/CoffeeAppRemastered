import 'package:coffee_app_remastered/view/components/navigation/navigation_bar.dart';
import 'package:coffee_app_remastered/view/components/navigation/page_icon_holder.dart';
import 'package:coffee_app_remastered/view/pages/i_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  final List<PageIconHolder> pages;

  MainView({
    required this.pages,
    Key? key,
  }) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late IPage _currentPage = widget.pages[0].page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _currentPage.getAsWidget()),
      backgroundColor: ViewSettings.pageBackgroundColor,
      bottomNavigationBar: NavigationBar(
        unselectedItemColor: ViewSettings.unselectedColor,
        selectedItemColor: ViewSettings.selectedColor,
        pages: widget.pages,
        onPageChanged: _onPageChanged,
      ),
    );
  }

  void _onPageChanged(IPage newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }
}
