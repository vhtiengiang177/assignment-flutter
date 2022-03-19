import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:week3project/login-screen.dart';

import 'main.dart';

class SplashLogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: const LoginScreen(
        title: '',
      ),
      backgroundColor: Colors.white,
      image: new Image.network(
          'https://vi.seaicons.com/wp-content/uploads/2017/03/hamburger-icon-3.png'),
      photoSize: 110.0,
      title: Text(
        'Welcome!',
        style: TextStyle(fontSize: 40, color: Color(0xffdf4f11)),
      ),
    );
  }
}
