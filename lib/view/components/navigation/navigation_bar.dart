import 'package:coffee_app_remastered/view/pages/i_navigable_page.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  final List<INavigationBarPage> pages;
  final ValueChanged<INavigationBarPage> onPageChanged;
  final Color unselectedItemColor;
  final Color selectedItemColor;

  const NavigationBar({
    required this.pages,
    required this.onPageChanged,
    required this.unselectedItemColor,
    required this.selectedItemColor,
    Key? key,
  }) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  var _currentIndex = 0;
  late Color _cornerColor = _getCornerColor(widget.pages[0]);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _cornerColor,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: widget.unselectedItemColor,
            selectedItemColor: widget.selectedItemColor,
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            items: _getBarItems(widget.pages)),
      ),
    );
  }

  Color _getCornerColor(INavigationBarPage page) {
    final defaultColor = ViewSettings.defaultNavigationBarCornerColor;
    return page.navigationCornerColor ?? defaultColor;
  }

  void _onTabTapped(int index) {
    var newPage = widget.pages[index];
    setState(() {
      _currentIndex = index;
      _cornerColor = _getCornerColor(newPage);
    });
    widget.onPageChanged(newPage);
  }

  List<BottomNavigationBarItem> _getBarItems(
      Iterable<INavigationBarPage> pages) {
    var newList = <BottomNavigationBarItem>[];
    for (var page in pages) {
      newList.add(BottomNavigationBarItem(icon: page.icon, label: ""));
    }
    return newList;
  }
}
