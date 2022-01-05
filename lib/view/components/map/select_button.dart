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
    if (!selected) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: ViewSettings.selectedColor),
        onPressed: () => onSelected(),
        child: Text("Выбрать", style: TextStyle(
          fontSize: 14,
        ),),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: ViewSettings.unselectedColor),
        onPressed: null,
        child: Text("Выбрано"),
      );
    }
  }
}
