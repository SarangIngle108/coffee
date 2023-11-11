import 'dart:async';

import 'package:coffee_shop_app/auth/screens/login_screen.dart';
import 'package:coffee_shop_app/onboarding/onboarding_screen.dart';
import 'package:coffee_shop_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen())
        )
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.jpg',height: 150,width: 150,),
            SizedBox(height: 20,),
            CircularProgressIndicator(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
