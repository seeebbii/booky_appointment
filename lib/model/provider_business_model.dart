import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProviderBusinessModel {
  String? uid;
  String? businessCategory;
  String? shoplocation;
  String? status;
  String? dummytemp;
  Timestamp? businesscreateddate;
  List<Availableday> ? availabledays;


  ProviderBusinessModel(
    {
      this.uid,
      this.businessCategory,
      this.shoplocation,
      this.status,
      this.businesscreateddate,
      this.dummytemp,
      this.availabledays,

    }
        
        
        );


   ProviderBusinessModel.fromDocumentSnapshot(Map<String, dynamic> doc) {
    try {
       uid = doc['uid'];
    businessCategory = doc['businesscateogry'];
    shoplocation = doc['shoplocation'];
    status = doc['status'];
    businesscreateddate = doc['businesscreateddate'];
    dummytemp=doc['dummytemp'];
      Iterable daysArray = doc['days'];
      availabledays = daysArray.map((e) => Availableday.fromDocumentSnapshot(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

class Availableday {
  String ? dayName;
  TimeOfDay ? fromTime;
  TimeOfDay? toTIme;
  Availableday(
    {
      this.dayName,
      this.fromTime,
      this.toTIme,

    }
        
        
        );
        Availableday.fromDocumentSnapshot(DocumentSnapshot doc) {
    //= doc.id;
    dayName = doc['dayname'];
    fromTime = doc['fromtime'];
    toTIme = doc['totime'];
    

    // status = doc['status'];
  }
}

class Slots {
  String? startSlot;
  String? endSlot;

  Slots({
    this.startSlot,
    this.endSlot,
  });

  Slots.fromDocumentSnapshot(Map<String, dynamic> json) {
    startSlot = json['startSlot'];
    endSlot = json['endSlot'];
  }

  Map<String, dynamic> toJson() => {'startSlot':startSlot, 'endSlot':endSlot };
}


