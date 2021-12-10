import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProviderBusinessModel {
  String ? shopName;
  String? businessCategory;
  String? shoplocation;
  String? status;
  String? dummytemp;
  Timestamp? businesscreateddate;
  List<Availableday>? availabledays;

  ProviderBusinessModel({
    this.shopName,
    this.businessCategory,
    this.shoplocation,
    this.status,
    this.businesscreateddate,
    this.dummytemp,
    this.availabledays,
  });

  ProviderBusinessModel.fromDocumentSnapshot(Map<String, dynamic> doc) {
    try {
<<<<<<< HEAD
=======
      shopName=doc['shopName'];
>>>>>>> 8423b37a0df73172408fde1059a805571bdb12df
      businessCategory = doc['businessCategory'];
      shoplocation = doc['shoplocation'];
      status = doc['status'];
      businesscreateddate = doc['businesscreateddate'];
<<<<<<< HEAD
      dummytemp = doc['dummytemp'];
      availabledays = doc['availabledays']
          .ma((e) => Availableday.fromDocumentSnapshot(e))
          .toList();
=======
     // dummytemp = doc['dummytemp'];
      Iterable daysArray = doc['availabledays'];
      availabledays =
          daysArray.map((e) => Availableday.fromDocumentSnapshot(e )).toList();
>>>>>>> 8423b37a0df73172408fde1059a805571bdb12df
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  Map<String, dynamic> toJson() => {
        "businessCategory": businessCategory,
        "shopName":shopName,
        "shoplocation": shoplocation,
        "status": status,
        "businesscreateddate": businesscreateddate,
        "availabledays": availabledays?.map((e) => e.toJson()).toList()
      };

  static fromMap(e) {}
}

class Availableday {
  String? dayName;
  String? fromTime;
  String? toTIme;
  Availableday({
    this.dayName,
    this.fromTime,
    this.toTIme,
  });
<<<<<<< HEAD
  Availableday.fromDocumentSnapshot(Map<String, dynamic> doc) {
    //= doc.id;
    dayName = doc['dayname'];
    fromTime = doc['fromtime'];
=======
  Availableday.fromDocumentSnapshot(Map<String,dynamic> doc) {
    //= doc.id;
    dayName = doc['dayName'];
    fromTime = doc['fromTime'];
>>>>>>> 8423b37a0df73172408fde1059a805571bdb12df
    toTIme = doc['toTIme'];

    // status = doc['status'];
  }
  //herere to json
  Map<String, dynamic> toJson() => {
        "dayName": dayName,
        "fromTime": fromTime,
        "toTIme": toTIme,
      };
}
