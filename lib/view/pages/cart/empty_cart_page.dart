import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "В корзине ничего нет ",
              style: GoogleFonts.roboto(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            WidgetSpan(
              child: SvgPicture.asset("assets/emojies/confused-face.svg"),
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
