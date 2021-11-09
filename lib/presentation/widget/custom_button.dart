// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobfinder/presentation/widget/wsizedb.dart';

// ignore_for_file: prefer_const_constructors
class CustomButton extends StatelessWidget {
  final String buttontext;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final String? mode;
  final Color bordercolor;
  //final Color containercolor;
  final double borderradius;
  final double fontsize;
  final FontWeight fontweight;
  final Color fontcolor;
  final IconData? icon;
  final Color? iconColor;

  const CustomButton({
    Key? key,
    //required this.containercolor,
    this.onPressed,
    this.mode,
    required this.bordercolor,
    required this.fontweight,
    required this.fontcolor,
    this.icon,
    this.iconColor,
    required this.buttontext,
    required this.width,
    required this.height,
    required this.borderradius,
    required this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      child: RaisedButton(
        elevation: 0,
        onPressed: onPressed,
        color: bordercolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderradius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttontext,
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                  color: fontcolor,
                  letterSpacing: .5,
                  fontWeight: fontweight,
                  fontSize: fontsize,
                ),
              ),
            ),
            if (icon != null)
              Icon(
                icon,
                color: iconColor,
              ),
          ],
        ),
      ),
    );
  }
}
