import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/controller/authentication/auth_database_service.dart';
import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:booky/model/request_model_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class ShopServices {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RequestModelAdmin? request;
  static FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static void sendNotification(String token, String status) async {
    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    try {
      var header = {
        "Content-Type": "application/json",
        "Authorization":
            "key=AAAAUt6GPa8:APA91bGyk7vovJIb14bu_Ys-Z0KnSl-p_Rs9Mq6FnfzdCLfzfFwp_ARfEqgyX3MTtWwMkjnXUzix4U9yqbgJJiBF6f9cNPJFF-D-vWwxrbewlHOhbSe342tbGtkHYxyY7vx28HLhyE3m",
      };
      var request = {
        'notification': {
          'title': "Notification from Admin",
          'body': "Your request has been $status by Admin."
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

  static Future acceptRequest(
      String docId, ProviderBusinessModel shop, AuthModel user) async {
    AuthModel fetchedUser = await AuthDatabaseService().getUser(user.uid!);

    fetchedUser.isActiveted = true;

    await _firestore
        .collection('auth')
        .doc(fetchedUser.uid)
        .collection('notifications')
        .doc()
        .set({
      'message': "Your request has been accepted by the admin.",
      'acceptedTime': Timestamp.now()
    });

    shop.status = "upcomming";

    await _firestore
        .collection('serviceProvider-shop')
        .doc(docId)
        .update({'shop': shop.toJson(), 'uid': fetchedUser.toJson()});

    await _firestore.collection('auth').doc(fetchedUser.uid).update({
      'uid': fetchedUser.uid,
      'username': fetchedUser.username,
      'email': fetchedUser.email,
      'userCreatedDate': fetchedUser.userCreatedDate,
      'role': fetchedUser.role,
      'businessName': fetchedUser.businessName,
      'status': fetchedUser.status,
      'rating': fetchedUser.rating,
      'phoneNumber': fetchedUser.phoneNumber,
      'isActiveted': fetchedUser.isActiveted,
      'imageUrl': fetchedUser.imageUrl,
      'fcmToken': fetchedUser.fcmToken
    });
    sendNotification(fetchedUser.fcmToken!, 'Accepted');
  }

  static Future rejectRequest(
      String docId, ProviderBusinessModel shop, AuthModel user) async {
    AuthModel fetchedUser = await AuthDatabaseService().getUser(user.uid!);

    fetchedUser.isActiveted = false;

    await _firestore
        .collection('auth')
        .doc(fetchedUser.uid)
        .collection('notifications')
        .doc()
        .set({
      'message': "Your request has been rejected by the admin.",
      'acceptedTime': Timestamp.now()
    });

    shop.status = "Rejected";
    await _firestore
        .collection('serviceProvider-shop')
        .doc(docId)
        .update({'shop': shop.toJson(), 'uid': fetchedUser.toJson()});

    await _firestore.collection('auth').doc(fetchedUser.uid).update({
      'uid': fetchedUser.uid,
      'username': fetchedUser.username,
      'email': fetchedUser.email,
      'userCreatedDate': fetchedUser.userCreatedDate,
      'role': fetchedUser.role,
      'businessName': fetchedUser.businessName,
      'status': fetchedUser.status,
      'rating': fetchedUser.rating,
      'phoneNumber': fetchedUser.phoneNumber,
      'isActiveted': fetchedUser.isActiveted,
      'imageUrl': fetchedUser.imageUrl,
      'fcmToken': fetchedUser.fcmToken
    });
    sendNotification(fetchedUser.fcmToken!, 'Rejected');
  }

  static getAllShops() async {
    List<RequestModelAdmin> collection = [];
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('serviceProvider-shop');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    allData.forEach((element) {
      collection.add(RequestModelAdmin.fromDocumentSnapshot(
          element as Map<String, dynamic>));
    });
    return collection;
  }
}
