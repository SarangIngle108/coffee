import 'package:coffee_shop_app/auth/screens/login_screen.dart';
import 'package:coffee_shop_app/auth/screens/signup_screen.dart';
import 'package:coffee_shop_app/auth/screens/verification_screen.dart';
import 'package:coffee_shop_app/constants.dart';
import 'package:coffee_shop_app/firebase_options.dart';
import 'package:coffee_shop_app/onboarding/onboarding_screen.dart';
import 'package:coffee_shop_app/screens/home_screen.dart';
import 'package:coffee_shop_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: bgColor,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54)
        ),
       // useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

