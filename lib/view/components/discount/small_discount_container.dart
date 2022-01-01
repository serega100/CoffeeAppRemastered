import 'package:coffee_app_remastered/view/components/discount/action/i_discount_action.dart';
import 'package:coffee_app_remastered/view/components/discount/discount_contatiner_typography.dart';
import 'package:coffee_app_remastered/view/components/discount/i_discount_container.dart';
import 'package:flutter/material.dart';

class SmallDiscountContainer extends StatelessWidget implements IDiscountContainer {
  String _title;
  IDiscountAction? _action;
  Image _backgroundImage; // todo switch Image to ImageProvider
  EdgeInsetsGeometry? _margin;
  double? _width;

  SmallDiscountContainer({
    required String title,
    IDiscountAction? action,
    required Image backgroundImage,
    EdgeInsetsGeometry? margin,
    double? width,
    Key? key,
  })  : _title = title,
        _action = action,
        _backgroundImage = backgroundImage,
        _margin = margin,
        _width = width,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = <Widget>[
      DiscountContainerTitle(_title),
    ];

    if (_action != null) {
      content.add(Spacer());
      content.add(_action!.widget);
    } else {
      content.add(DiscountContainerActionText(""));
    }

    return Container(
      height: 210,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: _backgroundImage.image,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.srcOver),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(20),
      margin: _margin,
      width: _width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      ),
    );
  }
}
