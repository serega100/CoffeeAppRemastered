import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final bool selected;
  final Function() onSelected;

  const SelectButton({
    this.selected = false,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return _getClickableStar(ViewSettings.selectedColor, true, onSelected);
    } else {
      return _getClickableStar(ViewSettings.unselectedColor, false, onSelected);
    }
  }

  Widget _getClickableStar(
      Color color, bool isFull, void Function()? onPressed) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Icon(
          (isFull) ? Icons.star : Icons.star_border,
          color: color,
          size: 30.0,
        ),
      ),
    );
  }
}
