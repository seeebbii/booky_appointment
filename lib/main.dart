// import 'package:booky/screens/customer/appointment.dart';
import 'package:booky/screens/Admin/admin.dart';
import 'package:booky/screens/Login/auth_decider.dart';
import 'package:booky/screens/Login/login_page.dart';
import 'package:booky/screens/Login/sign_up.dart';
import 'package:booky/screens/about_app.dart';
import 'package:booky/screens/customer/appointment_three.dart';
import 'package:booky/screens/customer/appointment_two.dart';
import 'package:booky/screens/customer/home_customer.dart';
import 'package:booky/screens/customer/notification.dart';
import 'package:booky/screens/customer/setting.dart';
import 'package:booky/screens/customer/card.dart';
import 'package:booky/screens/customer/Appoinments.dart';
import 'package:booky/screens/customer/appointmet_one.dart';
import 'package:booky/screens/customer/user_home.dart';
import 'package:booky/screens/service_provider/appointment_sp.dart';
import 'package:booky/screens/service_provider/business_hours_one.dart';
import 'package:booky/screens/service_provider/home_sp.dart';
import 'package:booky/screens/service_provider/location_sp.dart';
import 'package:booky/screens/service_provider/sign_up_sp.dart';
import 'package:booky/screens/service_provider/test_sp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/authentication/auth_controller.dart';
import 'screens/Splash.dart';
// import 'screens/customer/test.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(
    GetMaterialApp(
      title: 'Booky',
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: [
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],

      // theme: ThemeData(fontFamily: "AAANIQ-Bold"),
      theme: ThemeData(
        fontFamily: 'PNU',
        canvasColor: Colors.transparent,
      ),
      // supportedLocales: const [
      //   Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      // ],
      // locale: const Locale(
      //     "ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales,
      home: AuthDecider(),
    ),
  );
}
