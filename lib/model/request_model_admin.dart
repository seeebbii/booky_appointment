import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestModelAdmin {
  String? docid;
  ProviderBusinessModel? shop;
  AuthModel? user;

  RequestModelAdmin({
    this.docid,
    this.shop,
    this.user,
  });

  RequestModelAdmin.fromDocumentSnapshot(Map<String, dynamic> doc) {
    try {
      docid = doc['docid'];
      shop = doc['shop'];
      user = doc['detail'];
    } catch (e) {}
    Map<String, dynamic> toJson() => {
          'docid': doc,
          'shop': shop,
          'providerdetail': user,
        };
  }
}
