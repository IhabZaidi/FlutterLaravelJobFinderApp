import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
class CustomTextField extends StatelessWidget {
  final double borderradius;
  final Color bordercolor;
  final TextEditingController controller;
  final double widh;
  final double height;
  final IconData icon;
  final Color iconColor;
  final String hinttext;
  final Color hintColor;
  final double fontsize;
  //final FontWeight fontweight;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.borderradius,
    required this.bordercolor,
    required this.widh,
    required this.height,
    required this.icon,
    required this.iconColor,
    required this.hinttext,
    required this.hintColor,
    required this.fontsize,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderradius),
        color: bordercolor,
      ),
      width: MediaQuery.of(context).size.width * widh,
      height: MediaQuery.of(context).size.height * height,
      child: TextField(
        controller: controller,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              icon,
              color: iconColor,
            ),
            hintText: hinttext,
            hintTextDirection: TextDirection.ltr,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: fontsize,
            ),
            border: InputBorder.none),
        obscureText: obscureText,
      ),
    );
  }
}
