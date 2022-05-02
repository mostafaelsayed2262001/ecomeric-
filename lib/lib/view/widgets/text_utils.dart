import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextDecoration? underline;
  final TextOverflow? overFlow;

   const TextUtils(
      {required this.text,
      required this.fontWeight,
      required this.fontSize,
      required this.color,
      this.underline,
      this.overFlow,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          decoration: underline,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          overflow: overFlow
        ),
      ),
    );
  }
}
