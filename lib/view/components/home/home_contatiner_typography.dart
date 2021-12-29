import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeContainerTitle extends StatelessWidget {
  String _text;

  HomeContainerTitle(String text, {Key? key})
      : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(_text,
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ));
  }
}

class HomeContainerActionText extends StatelessWidget {
  String _text;

  HomeContainerActionText(String text, {Key? key})
      : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: GoogleFonts.roboto(
        color: Color(0xFF27AE60),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }
}
