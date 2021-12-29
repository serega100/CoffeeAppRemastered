import 'package:coffee_app_remastered/view/components/home/home_contatiner_typography.dart';
import 'package:coffee_app_remastered/view/components/home/i_home_container.dart';
import 'package:flutter/material.dart';

class SmallHomeContainer extends StatelessWidget implements IHomeContainer {
  String _title;
  String? _actionText;
  Image _backgroundImage; // todo switch Image to ImageProvider
  EdgeInsetsGeometry? _margin;
  double? _width;

  SmallHomeContainer({
    required String title,
    String? actionText,
    required Image backgroundImage,
    EdgeInsetsGeometry? margin,
    double? width,
    Key? key,
  })  : _title = title,
        _actionText = actionText,
        _backgroundImage = backgroundImage,
        _margin = margin,
        _width = width,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = <Widget>[
      HomeContainerTitle(_title),
      const SizedBox(height: 20)
    ];

    if (_actionText != null) {
      content.add(HomeContainerActionText(_actionText!));
    } else {
      content.add(HomeContainerActionText(""));
    }

    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      ),
    );
  }
}
