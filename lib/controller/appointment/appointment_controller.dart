import 'package:booky/controller/authentication/auth_database_service.dart';
import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/model/request_model_admin.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final authController = Get.put(AuthController());

  Future<bool> createAppointmentRequest({
    required RequestModelAdmin? requestModelAdmin,
    required DateTime? selectedDate,
    required String? selectedTime,
  }) async {
    try {
      DocumentReference document = _firestore.collection('appointments').doc();

      // // GETTING ALL USERS AND CHECKING WHERE THE ROLE IS ADMIN
      // List<AuthModel> collection = [];
      // CollectionReference _collectionRef =
      //     FirebaseFirestore.instance.collection('auth');

      // // Get docs from collection reference
      // QuerySnapshot querySnapshot = await _collectionRef.get();

      // // Get data from docs and convert map to List
      // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      // print(allData);
      // allData.forEach((element) {
      //   print(element);
      //   collection
      //       .add(AuthModel.fromMapSnapshot(element as Map<String, dynamic>));
      // });

      // collection.forEach((element) {
      //   if(element.role == 'admin'){
      //     _firebaseMessaging.sendMessage(
      //       to: element.fcmToken,
      //       data: {
      //         'message' : "A new service request have been received, Business Name: ${businessModel.shopName}"
      //       }
      //     );
      //   }
      // });

      await document.set({
        "uid": authController.currentUser.value.toJson(),
        "appointment-time": selectedTime,
        "appointment-date": selectedDate?.toIso8601String(),
        "appointment-details": requestModelAdmin?.toJson(),
        "createdAt": Timestamp.now(),
        "docId": document.id,
      });
      print(document.id);
      CustomSnackBar.showSnackBar(
          title: "Appointment submitted successfully",
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
