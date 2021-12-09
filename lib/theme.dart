import 'package:flutter/material.dart';

const kBookyColor = Color(0xFF20474D);

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color(0xFFF1EFF1);
  static const Color loginGradientEnd = Color(0xFFF1EFF1);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

// list of booky colors
const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF20474D);
const kSecondaryColor = Color(0xFF082F46);
const kPrimaryTextColor = Color(0xFF20474D);
const kSecondaryTextColor = Color(0xFF747474);
const kWhiteColor = Color(0xFFF1EFF1);
const kBlackColor = Color(0xFF25272A);
const kAppDividerColor = Color(0xFFDADADA);
const kAppointmentColor = Color(0xFF28676E);
const kLightGray = Color(0xff8E8E8E);
const kToggleButton = Color(0xFF34c759);





const kGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF20474D), Color(0xFF3F6F77)],
);

// default Shadow of booky app
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);
