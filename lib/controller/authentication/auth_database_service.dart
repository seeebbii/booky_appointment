

import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class AuthDatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();

  void updateFcmToken(String token, String uid)async{
    print(token);
    await _firestore.collection("auth").doc(uid).update({
      "fcmToken": token
    });
  }

  Future<bool> createUserInDatabase(AuthModel user) async {
    try {
      await _firestore.collection('auth').doc(user.uid).set({
        'uid': user.uid,
        'username': user.username,
        'email': user.email,
        'userCreatedDate': user.userCreatedDate,
        'role': user.role,
        'businessName': user.businessName,
        'status': user.status,
        'rating': user.rating,
         'phoneNumber': user.phoneNumber,
         'isActiveted':   user.isActiveted,
         'imageUrl': user.imageUrl,
        'fcmToken' : user.fcmToken
      });
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

           
         
           
         
  // Future<bool> createAppoitmentInDatabase(Schedule schedule) async {
  //   try {
  //     Timestamp currentTime = Timestamp.now();
  //     DocumentReference document = _firestore.collection('available-appointments').doc();
  //     await document.set({
  //       "nurseId": authController.currentUser.value.uid,
  //       "schedule": schedule.toJson(),
  //       "createdAt": Timestamp.now(),
  //       "docId" : document.id
  //     });
  //     createAppointmentInNurseCollection(schedule, currentTime, document);
  //     CustomSnackBar.showSnackBar(
  //         title: "Appoitment successfully created",
  //         message: '',
  //         backgroundColor: snackBarSuccess);
  //     return true;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return false;
  //   }
  // }

  // Future<bool> createAppointmentInNurseCollection(
  //     Schedule schedule, Timestamp currentTime, DocumentReference document) async {
  //   try {
  //     await _firestore
  //         .collection('nurse')
  //         .doc(authController.currentUser.value.uid)
  //         .collection('appointments')
  //         .doc(document.id)
  //         .set({
  //       "nurseId": authController.currentUser.value.uid,
  //       "schedule": schedule.toJson(),
  //       "createdAt": currentTime,
  //       "docId" : document.id
  //     });
  //     return true;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return false;
  //   }
  // }

  Future<AuthModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
      await _firestore.collection("auth").doc(uid).get();
      if (!doc.exists) {
        CustomSnackBar.showSnackBar(
            title: "Not Authorized",
            message: '',
            backgroundColor: snackBarError);
      }
      return AuthModel.fromDocumentSnapshot(doc);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}