// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobfinder/logic/cubit/authcubit_cubit.dart';
import 'package:jobfinder/presentation/screen/home_screen.dart';
import 'package:jobfinder/presentation/screen/login_screen.dart';
import 'package:jobfinder/presentation/screen/register_screen.dart';
import 'package:jobfinder/presentation/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AuthcubitCubit _authcubitCubit = AuthcubitCubit();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authcubitCubit,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignUpScreen(),
      ),
    );
  }
}
