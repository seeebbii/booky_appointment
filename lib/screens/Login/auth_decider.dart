import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/controller/service_provider/service_provider_controller.dart';
import 'package:booky/screens/customer/home_customer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class AuthDecider extends StatelessWidget {
  AuthDecider({Key? key}) : super(key: key);

  final authController =   Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authController.getUserId(),
        builder: (ctx, AsyncSnapshot auth) {
          if (auth.hasData && auth.data != null) {
            authController.getUserById(auth.data);
            return HomeCustomer();
          } else {
            return LoginPage();
          }
        });
  }
}