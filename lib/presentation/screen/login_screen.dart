import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobfinder/logic/cubit/authcubit_cubit.dart';
import 'package:jobfinder/logic/repository/get_jobs.dart';
import 'package:jobfinder/presentation/screen/home_screen.dart';
import 'package:jobfinder/presentation/screen/register_screen.dart';
import 'package:jobfinder/presentation/widget/custom_button.dart';
import 'package:jobfinder/presentation/widget/custom_text.dart';
import 'package:jobfinder/presentation/widget/custom_textfield.dart';
import 'package:jobfinder/presentation/widget/wsizedb.dart';

// ignore_for_file: prefer_const_constructors

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthcubitCubit, AuthcubitState> (
      listener: (context, state) async {
        if (state is AuthcubitLoged) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              content: Text("Loged in with success !"),
            ),
          );
          JobsRepositery().allJobs();
          await Future.delayed(Duration(seconds: 2));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen(otherJobs: JobsRepositery().otherJobs, recommendedJobs: JobsRepositery().isrecJobs,)));
        } else if (state is AuthcubitFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              content: Text("Loged in Failed !"),
            ),
          );
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            WSizedBox(
              wval: 0,
              hval: 0.1,
            ),
            TextWidget(
              text: 'Login to your account',
              color: Colors.black87,
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            WSizedBox(
              wval: 0,
              hval: 0.01,
            ),
            TextWidget(
              text:
                  'Enter your email and password to access \n your account or create an account',
              color: Colors.black87,
              size: 10,
              fontWeight: FontWeight.normal,
            ),
            WSizedBox(
              wval: 0,
              hval: 0.08,
            ),
            CustomTextField(
              bordercolor: Colors.white,
              borderradius: 8,
              fontsize: 12,
              height: 0.06,
              hintColor: Color.fromARGB(255, 58, 50, 113),
              hinttext: 'mail',
              icon: Icons.mail,
              iconColor: Color.fromARGB(255, 58, 50, 113),
              widh: 0.9,
              obscureText: false,
              controller: mailcontroller,
            ),
            WSizedBox(
              wval: 0,
              hval: 0.03,
            ),
            CustomTextField(
              bordercolor: Colors.white,
              borderradius: 8,
              fontsize: 12,
              height: 0.06,
              hintColor: Color.fromARGB(255, 58, 50, 113),
              hinttext: 'pass',
              icon: Icons.lock,
              iconColor: Color.fromARGB(255, 58, 50, 113),
              widh: 0.9,
              obscureText: false,
              controller: passcontroller,
            ),
            WSizedBox(
              wval: 0,
              hval: 0.03,
            ),
            CustomButton(
              bordercolor: Color.fromARGB(255, 69, 71, 192),
              borderradius: 8,
              buttontext: 'Login',
              fontcolor: Colors.white,
              fontsize: 12,
              fontweight: FontWeight.bold,
              height: 0.05,
              width: 0.9,
              onPressed: () {
                BlocProvider.of<AuthcubitCubit>(context).loginMethod(username: mailcontroller.text, password: passcontroller.text );
              },
            ),
            WSizedBox(
              wval: 0,
              hval: 0.03,
            ),
            GestureDetector(
              onTap: () {},
              child: TextWidget(
                text: 'Forgot your password ?',
                color: Colors.red,
                size: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            WSizedBox(
              wval: 0,
              hval: 0.07,
            ),
            TextWidget(
              text: '~ or continue with ~',
              color: Colors.black87,
              size: 10,
              fontWeight: FontWeight.bold,
            ),
            WSizedBox(
              wval: 0,
              hval: 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 58, 50, 113),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/facebook.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      WSizedBox(
                        wval: 0.01,
                        hval: 0,
                      ),
                      TextWidget(
                        text: 'Facebook',
                        color: Color.fromARGB(255, 58, 50, 113),
                        size: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 58, 50, 113),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/google.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      WSizedBox(
                        wval: 0.01,
                        hval: 0,
                      ),
                      TextWidget(
                        text: 'Google',
                        color: Color.fromARGB(255, 58, 50, 113),
                        size: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WSizedBox(
              wval: 0,
              hval: 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: TextWidget(
                    text: 'Dont have an account ?',
                    color: Colors.black87,
                    size: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                WSizedBox(
                  wval: 0.01,
                  hval: 0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: TextWidget(
                    text: 'signup',
                    color: Colors.red,
                    size: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
