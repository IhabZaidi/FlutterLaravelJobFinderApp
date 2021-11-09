// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobfinder/presentation/widget/custom_button.dart';
import 'package:jobfinder/presentation/widget/wsizedb.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/findjob.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              WSizedBox(
                hval: 0.88,
                wval: 0,
              ),
              Row(
                children: [
                  WSizedBox(
                    hval: 0,
                    wval: 0.72,
                  ),
                  CustomButton(
                    bordercolor: Color.fromARGB(255, 187, 197, 243),
                    borderradius: 5,
                    buttontext: 'Get started',
                    fontcolor: Color.fromARGB(255, 58, 50, 113),
                    fontsize: 10,
                    fontweight: FontWeight.bold,
                    height: 0.05,
                    width: 0.26,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
