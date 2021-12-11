import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestModelAdmin {
  String? docid;
  ProviderBusinessModel? shop;
  Timestamp? createdAt;
  AuthModel? user;

  RequestModelAdmin({
    this.docid,
    this.shop,
    this.user,
    this.createdAt,
  });

  RequestModelAdmin.fromDocumentSnapshot(Map<String, dynamic> doc) {
    try {
      docid = doc['docId'];
      shop = ProviderBusinessModel.fromDocumentSnapshot(doc['shop']);
      user = AuthModel.fromMapSnapshot(doc['uid']);
      createdAt = doc['createdAt'];
    } catch (e) {}
  }

  Map<String, dynamic> toJson() => {
        'docid': docid,
        'shop': shop?.toJson(),
        'user': user?.toJson(),
        'createdAt': createdAt
      };
}
