import 'package:booky/screens/customer/home_customer.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
  static String id = 'Splash';
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: loadingIcon(),
    //   backgroundColor: Colors.white24,
    // );
    return SplashScreenView(
      navigateRoute: HomeCustomer(),
      duration: 4000,
      imageSrc: "assets/images/logoWithoutName.png",
      textType: TextType.ColorizeAnimationText,
      text: "B O O K Y",
      textStyle: TextStyle(
        fontSize: 30.0,
        fontFamily: 'Raleway-Black.ttf',
      ),
      backgroundColor: Color(0xff707070).withOpacity(0.3),
      colors: [
        Color(0xFFEBEDF0),
        Color(0xFF20474D),
        Color(0xFFEBEDF0),
        Color(0xFF20474D),
      ],
    );
  }
}
