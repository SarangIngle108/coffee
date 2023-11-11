import 'package:coffee_shop_app/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import 'onbording_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<OnboardingPage> onboardingPages = [
    OnboardingPage(
      title: 'Browse Coffee Shop',
      description: 'Browse through our coffee shop app and find your favorite products',
      imageUrl: 'assets/images/onboard4.jpeg',
    ),
    OnboardingPage(
      title: 'Add to Cart',
      description: 'Add Your Favorite products to the cart',
      imageUrl: 'assets/images/onboard2.jpeg',
    ),
    OnboardingPage(
      title: 'Check out',
      description: 'Check Out your items successfully. Thank You for shopping with us',
      imageUrl: 'assets/images/onboard3.jpeg',
    ),
    // Add more OnboardingPage instances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingPages.length,
        itemBuilder: (context, index) {
          return onboardingPages[index];
        },

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          // Move to the next page
          if (_pageController.page! < onboardingPages.length - 1) {
            _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          }
        },
        child: Icon(Icons.arrow_forward,color: Colors.white,),
      ),
    );
  }
}
