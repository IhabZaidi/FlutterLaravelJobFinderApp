// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_constructors
class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  String? txtstyle;
  FontWeight? fontWeight = FontWeight.bold;
  TextWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.size,
    this.txtstyle,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: txtstyle == null ? GoogleFonts.elMessiri(
        textStyle: TextStyle(
          color: color,
          letterSpacing: .5,
          fontWeight: fontWeight,
          fontSize: size,
        ),
      ) : txtstyle.toString() == 'bold' ? GoogleFonts.amiri(
        textStyle: TextStyle(
          color: color,
          letterSpacing: .5,
          fontWeight: FontWeight.bold,
          fontSize: size,
        ),
      ) : GoogleFonts.amiri(
        textStyle: TextStyle(
          color: color,
          letterSpacing: .5,
          fontWeight: FontWeight.normal,
          fontSize: size,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
