import 'package:coffee_app_remastered/view/components/discount/action/i_discount_action.dart';
import 'package:flutter/material.dart';

class CoffeeProgress extends StatefulWidget implements IDiscountAction {
  final int maxProgress;
  int _progress;

  get progress => _progress;

  CoffeeProgress(int currentProgress, this.maxProgress, {Key? key})
      : _progress = currentProgress,
        super(key: key);

  @override
  _CoffeeProgressState createState() => _CoffeeProgressState();

  @override
  Widget get widget => this;
}

class _CoffeeProgressState extends State<CoffeeProgress> {
  @override
  Widget build(BuildContext context) {
    var cups = getCups(widget.progress, widget.maxProgress);
    var lineCount = (cups.length / 2.0).ceil();
    var line1 = cups.take(lineCount).toList();
    var line2 = cups.skip(lineCount).toList();
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 3.0,
      runSpacing: 3.0,
      children: [
        Wrap(children: line1, spacing: 3.0),
        Wrap(children: line2, spacing: 3.0),
      ],
    );
  }

  List<Widget> getCups(int progress, int maxProgress) {
    var cups = <Widget>[];
    const cupSize = 30.0;
    var doneCup = const Icon(Icons.local_cafe, color: Color(0xFF27AE60), size: cupSize);
    var grayCup =
        const Icon(Icons.local_cafe, color: Color.fromRGBO(255, 255, 255, 0.5), size: cupSize);
    for (int i = 0; i < progress; i++) {
      cups.add(doneCup);
    }
    for (int i = 0; i < maxProgress - progress; i++) {
      cups.add(grayCup);
    }
    return cups;
  }
}
