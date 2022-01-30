import 'package:coffee_app_remastered/view/components/discount/action/i_discount_action.dart';
import 'package:coffee_app_remastered/view/components/discount/discount_container_typography.dart';
import 'package:coffee_app_remastered/view/components/discount/i_discount_container.dart';
import 'package:flutter/material.dart';

class BigDiscountContainer extends StatelessWidget
    implements IDiscountContainer {
  String _title;
  double? _height;
  String? _description;
  Image _backgroundImage; // todo switch Image to ImageProvider
  IDiscountAction? _action;
  EdgeInsetsGeometry? _margin;

  BigDiscountContainer({
    required String title,
    double? height,
    IDiscountAction? action,
    String? description,
    required Image backgroundImage,
    EdgeInsetsGeometry? margin,
    Key? key,
  })  : _title = title,
        _height = height,
        _action = action,
        _description = description,
        _backgroundImage = backgroundImage,
        _margin = margin,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = <Widget>[DiscountContainerTitle(_title)];
    if (_description != null) {
      content.add(const SizedBox(height: 5));
      content.add(DiscountContainerDescription(_description!));
    }
    if (_action != null) {
      content.add(const SizedBox(height: 10));
      content.add(_action!.widget);
    }

    return Container(
      height: _height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: _backgroundImage.image,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.srcOver),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(20).copyWith(right: 30),
      margin: _margin,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: (_description == null) ? 0.6 : 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: content,
          ),
        ),
      ),
    );
  }
}