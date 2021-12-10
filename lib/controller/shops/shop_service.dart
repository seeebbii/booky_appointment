import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static getAllShops() async {
    try {
      CollectionReference <Map<String, dynamic>> doc =  FirebaseFirestore.instance.collection("serviceProvider-shop");
      doc.get().then((value) {
        print(value);
      });
   //   AuthModel.fromDocumentSnapshot(doc);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
