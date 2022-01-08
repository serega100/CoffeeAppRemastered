import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTitle extends StatelessWidget {
  final String text;
  late final EdgeInsetsGeometry margin;
  final BackButton? backButton;

  PageTitle(
    this.text, {
    EdgeInsetsGeometry? margin,
    this.backButton,
    Key? key,
  }) : super(key: key) {
    if (margin != null) {
      this.margin = margin;
    } else if (backButton == null) {
      this.margin = ViewSettings.pageTitleMargin;
    } else {
      this.margin = ViewSettings.buttonedPageTitleMargin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        children: [
          if (backButton != null) backButton!,
          Text(
            text,
            style: GoogleFonts.montserrat(fontSize: 32),
          ),
        ],
      ),
    );
  }
}
