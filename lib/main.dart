// import 'package:booky/screens/customer/appointment.dart';
import 'package:booky/screens/Login/auth_decider.dart';
import 'package:booky/screens/Login/login_page.dart';
import 'package:booky/screens/service_provider/location_sp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/initialize_controllers.dart';
import 'controller/authentication/auth_controller.dart';
import 'controller/service_provider/service_provider_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  // InitializeControllers.init();
  Get.put(AuthController());
  Get.put(ServiceProvider());
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
      home: LocationSp(),
    ),
  );
}
