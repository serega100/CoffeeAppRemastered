import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTitle extends StatelessWidget {
  String _text;
  EdgeInsetsGeometry? _margin;

  PageTitle(String text, {EdgeInsetsGeometry? margin, Key? key})
      : _text = text,
        _margin = margin,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      child: Text(
        _text,
        style: GoogleFonts.montserrat(fontSize: 32),
      ),
    );
  }
}
