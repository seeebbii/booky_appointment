import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static getAllShops() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('serviceProvider-shop');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);

    // try {
    //   CollectionReference <Map<String, dynamic>> doc =  _firestore.collection("serviceProvider-shop");

    //   if (!doc.isEmpty) {
    //     CustomSnackBar.showSnackBar(
    //         title: "Not Authorized",
    //         message: '',
    //         backgroundColor: snackBarError);
    //   }
    //   return AuthModel.fromDocumentSnapshot(doc);
    // } catch (e) {
    //   debugPrint(e.toString());
    //   rethrow;
    // }
  }
}
