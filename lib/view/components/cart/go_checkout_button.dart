import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoCheckoutButton extends StatelessWidget {
  final String sumText;
  final void Function() onPressed;

  const GoCheckoutButton({
    required this.sumText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(
        left: ViewSettings.pageMargin.left,
        right: ViewSettings.pageMargin.right,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: ViewSettings.mainColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(0, -4),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                      child: Text("Оформить",
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: Center(
                      child: Text(sumText,
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: ViewSettings.mainColor,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
