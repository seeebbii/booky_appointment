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

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authController.getUserId(),
        builder: (ctx, AsyncSnapshot auth) {
          if (auth.hasData && auth.data != null) {
            authController.getUserById(auth.data).then((value) {
              AuthDatabaseService().updateFcmToken(
                  authController.currentUser.value.fcmToken!, auth.data);
            });
            debugPrint("Role Save in DB is : ${authController.role}");
            if (authController.role.value == "admin") {
              return AdminHome();
            } else if (authController.role.value == "serviceProvider") {
              if (authController.isActivated.value == true) {
                return HomeServiceProvider();
              } else {
                authController.logOut();
                return unVerifyAccount('ERROR 404',
                    'ERROR 404: Your Application is still under process.');
              }
            } else if (authController.role.value == "customer") {
              return HomeCustomer();
            } else {
              debugPrint("else");
              authController.logOut();
              return unVerifyAccount('404', 'ERROR 404: Not Found.');
            }
          } else {
            return LoginPage();
          }
        });
  }

  Scaffold unVerifyAccount(String title, String message) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            message,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
