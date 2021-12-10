import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/model/request_model_admin.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RequestModelAdmin ? request;
 
 static  getAllShops() async {
   List<RequestModelAdmin>  collection=[];
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('serviceProvider-shop');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    var collect=[];
     // RequestModelAdmin.fromDocumentSnapshot(allData);
    print(allData);
allData.forEach((element) {
  collection.add(RequestModelAdmin.fromDocumentSnapshot(element as Map<String,dynamic>));

 
});
return collection;
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