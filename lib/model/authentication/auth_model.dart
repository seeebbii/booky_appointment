import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AuthModel {
  String? uid;
  String? username;
  String? email;
  String? status;
  Timestamp? userCreatedDate;
  String? role;

  AuthModel(
      {this.uid,
        this.username,
        this.email,
        this.status,
        this.userCreatedDate,
        this.role});

  AuthModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    uid = doc.id;
    username = doc['username'];
    email = doc['email'];
    userCreatedDate = doc['userCreatedDate'];
    role = doc['role'];
    // status = doc['status'];
  }
}