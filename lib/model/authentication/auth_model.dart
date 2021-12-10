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
  String? fcmToken;

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
      this.phoneNumber,
      this.fcmToken});


  AuthModel.fromMapSnapshot(Map<String, dynamic> doc) {
    uid = doc['uid'];
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
    fcmToken = doc['fcmToken'];
  }

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
    fcmToken = doc['fcmToken'];
  }
  AuthModel.fromMapSnapshot(Map<String, dynamic> doc) {
    uid = doc['uid'];
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
    fcmToken = doc['fcmToken'];
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,
        'userCreatedDate': userCreatedDate,
        'role': role,
        'businessName': businessName,
        'rating': rating,
        'status': status,
        'imageUrl': imageUrl,
        'isActiveted': isActiveted,
        'phoneNumber': phoneNumber,
        'fcmToken': fcmToken
      };
}
