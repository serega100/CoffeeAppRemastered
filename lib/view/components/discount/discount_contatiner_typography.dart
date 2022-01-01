import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscountContainerTitle extends StatelessWidget {
  String _text;

  DiscountContainerTitle(String text, {Key? key})
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

class DiscountContainerActionText extends StatelessWidget {
  String _text;

  DiscountContainerActionText(String text, {Key? key})
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

class DiscountContainerDescription extends StatelessWidget {
  String _text;

  DiscountContainerDescription(String text, {Key? key})
      : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: GoogleFonts.roboto(
        color: Colors.white,
        fontWeight: FontWeight.w300,
        fontSize: 12,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
