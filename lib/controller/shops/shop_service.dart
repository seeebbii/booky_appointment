import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;




 Stream<List<AvailableRequests>> getAllPost() {
    return _firestore
        .collection('serviceProvider-shop')
        .snapshots()
        .map((snapshot) {
      List<AvailableRequests> retVal = <AvailableRequests>[];
      snapshot.docs.forEach((element) {
        retVal.add(AvailableRequests.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }







  static getAllShops() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('serviceProvider-shop');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
    allData.forEach((element) {
      print("Customer Shomp =  " + element.toString());
    });

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


{createdAt:
Timestamp(seconds=1639132616, nanoseconds=905812000), 
uid: ZWj0iJKk6GPMHfplJzA4i5TIKNJ2,
shop: {shoplocation: lahore Pakistan,
businessCategory: Trainer, availabledays: 
[{dayName: Wednesday, fromTime: 01:30, toTIme: 23:30}], 
businesscreateddate: Timestamp(seconds=1639132614,
nanoseconds=117145000),
status: Requested }, 
docId: tTwcS1DbFbfRZff0C4S3 }