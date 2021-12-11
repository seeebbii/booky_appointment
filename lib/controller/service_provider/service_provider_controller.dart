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
          _firebaseMessaging.sendMessage(
            to: element.fcmToken,
            data: {
              'message' : "A new service request have been received, Business Name: ${businessModel.shopName}"
            }
          );
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
