import 'package:coffee_app_remastered/view/components/home/home_contatiner_typography.dart';
import 'package:coffee_app_remastered/view/components/home/i_home_container.dart';
import 'package:flutter/material.dart';

class BigHomeContainer extends StatelessWidget implements IHomeContainer {
  String _title;
  String? _actionText;
  Image _backgroundImage; // todo switch Image to ImageProvider
  EdgeInsetsGeometry? _margin;

  BigHomeContainer({
    required String title,
    String? actionText,
    required Image backgroundImage,
    EdgeInsetsGeometry? margin,
    Key? key,
  })  : _title = title,
        _actionText = actionText,
        _backgroundImage = backgroundImage,
        _margin = margin,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = <Widget>[HomeContainerTitle(_title)];
    if (_actionText != null) {
      content.add(const SizedBox(height: 10));
      content.add(HomeContainerActionText(_actionText!));
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
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: content,
            ),
          ),
        ],
      ),
    );
  }
}