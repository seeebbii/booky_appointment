// ignore_for_file: unrelated_type_equality_checks

import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/controller/authentication/auth_database_service.dart';
import 'package:booky/screens/Admin/admin.dart';
import 'package:booky/screens/customer/home_customer.dart';
import 'package:booky/screens/service_provider/home_sp.dart';
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
            AuthDatabaseService().updateFcmToken(authController.currentUser.value.fcmToken!, authController.currentUser.value.uid!);
            debugPrint("Role Save in DB is : ${authController.role}");
            if (authController.role.value == "admin") {
              return AdminHome();
            } else if (authController.role.value == "serviceProvider") {
              return HomeServiceProvider();
            } else if (authController.role.value == "customer") {
              return HomeCustomer();
            } else {
              print("else");
              return Scaffold(
                appBar: AppBar(
                  title: const Text('404'),
                ),
                body: const Center(
                  child: Text('ERROR 404: Not Found'),
                ),
              );
            }
          } else {
            return LoginPage();
          }
        });
  }
}
