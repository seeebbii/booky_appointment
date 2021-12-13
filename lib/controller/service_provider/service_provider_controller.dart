import 'dart:convert';

import 'package:booky/controller/authentication/auth_database_service.dart';
import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ServiceProvider extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final authController = Get.put(AuthController());

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();
  TextEditingController signupBusinessNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  RxInt choise = 0.obs;

  late ProviderBusinessModel businessModel;
  List<Availableday> availabledays = [];
  Map<int, String> categoryChoice = {
    0: 'Car Wash',
    1: 'Womens Saloon',
    2: 'BarberShop',
    3: 'Trainer',
    4: 'Other',
  };

  static void sendNotification(String token, String shopName) async {
    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    try {
      var header = {
        "Content-Type": "application/json",
        "Authorization":
        "key=AAAAUt6GPa8:APA91bGyk7vovJIb14bu_Ys-Z0KnSl-p_Rs9Mq6FnfzdCLfzfFwp_ARfEqgyX3MTtWwMkjnXUzix4U9yqbgJJiBF6f9cNPJFF-D-vWwxrbewlHOhbSe342tbGtkHYxyY7vx28HLhyE3m",
      };
      var request = {
        'notification': {
          'title': "A new service request",
          'body': "A new service request have been received, Business Name: $shopName"
        },
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'type': 'COMMENT'
        },
        'to': '$token'
      };

      http.Response response =
      await http.post(url, headers: header, body: jsonEncode(request));
      print(response.body);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<bool> createBusnessShopInDatabase() async {
    try {
      DocumentReference document =
          _firestore.collection('serviceProvider-shop').doc();

      // GETTING ALL USERS AND CHECKING WHERE THE ROLE IS ADMIN
      List<AuthModel> collection = [];
      CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('auth');

      // Get docs from collection reference
      QuerySnapshot querySnapshot = await _collectionRef.get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      print(allData);
      allData.forEach((element) {
        print(element);
        collection.add(AuthModel.fromMapSnapshot(element as Map<String, dynamic>));
      });


      collection.forEach((element) {
        if(element.role == 'admin'){
          sendNotification(element.fcmToken!, businessModel.shopName!);
        }
      });

      await document.set({
        "uid": authController.currentUser.value.toJson(),
        "shop": businessModel.toJson(),
        "createdAt": Timestamp.now(),
        "docId": document.id,
      });
      print(document.id);
      CustomSnackBar.showSnackBar(
          title: "request submitted successfully",
          message: '',
          backgroundColor: snackBarSuccess);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  // @override
  // void onInit() {
  //   getProductList();
  //   super.onInit();
  // }
}
