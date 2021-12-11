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
      shopName=doc['shopName'];
      businessCategory = doc['businessCategory'];
      shoplocation = doc['shoplocation'];
      status = doc['status'];
      businesscreateddate = doc['businesscreateddate'];
     // dummytemp = doc['dummytemp'];
      Iterable daysArray = doc['availabledays'];
      availabledays =
          daysArray.map((e) => Availableday.fromDocumentSnapshot(e )).toList();
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
  Availableday.fromDocumentSnapshot(Map<String,dynamic> doc) {
    //= doc.id;
    dayName = doc['dayName'];
    fromTime = doc['fromTime'];
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
