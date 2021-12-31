import 'package:coffee_app_remastered/view/components/navigation/page_icon_holder.dart';
import 'package:coffee_app_remastered/view/pages/i_page.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget { // todo showing drop shadow while a bottom sheet is showing
  final List<PageIconHolder> pages;
  final ValueChanged<IPage> onPageChanged;
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

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      var newPage = widget.pages[index].page;
      widget.onPageChanged(newPage);
    });
  }

  List<BottomNavigationBarItem> _getBarItems(Iterable<PageIconHolder> pages) {
    var newList = <BottomNavigationBarItem>[];
    for (var element in pages) {
      newList.add(BottomNavigationBarItem(icon: element.icon, label: ""));
    }
    return newList;
  }
}
