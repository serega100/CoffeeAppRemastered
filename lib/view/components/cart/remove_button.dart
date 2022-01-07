import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';

class RemoveButton extends StatelessWidget {
  final void Function() onPressed;

  const RemoveButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 35,
        height: 35,
        decoration: const BoxDecoration(
          color: ViewSettings.secondColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onPressed,
              child: const Center(
                child: Icon(Icons.close, color: Colors.white),
              )),
        ),
      ),
    );
  }
}
