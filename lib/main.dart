import 'package:flutter/material.dart';
import 'package:week3project/home-screen.dart';
import 'package:week3project/login-screen.dart';
import 'package:week3project/palette.dart';
import 'package:week3project/splash-screen.dart';

import 'register-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.darkTheme,
      ),
      home: SplashLogoScreen(),
    );
  }
}


