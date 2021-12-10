import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel {
  String? uid;
  String? username;
  String? email;
  String? status;
  Timestamp? userCreatedDate;
  String? role;
  String? businessName;
  int? rating;
  String? imageUrl;
  bool? isActiveted;
  String? phoneNumber;

  AuthModel(
      {this.uid,
      this.username,
      this.email,
      this.status,
      this.userCreatedDate,
      this.role,
      this.businessName,
      this.rating,
      this.imageUrl,
      this.isActiveted,
      this.phoneNumber});

  AuthModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    uid = doc.id;
    username = doc['username'];
    email = doc['email'];
    userCreatedDate = doc['userCreatedDate'];
    role = doc['role'];
    businessName = doc['businessName'];
    rating = doc['rating'];
    status = doc['status'];
    imageUrl = doc['imageUrl'];
    isActiveted = doc['isActiveted'];
    phoneNumber = doc['phoneNumber'];
  }
}
