import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String? message;
  Timestamp? acceptedTime;

  NotificationModel({
    this.message,
    this.acceptedTime,
  });

  NotificationModel.fromMapSnapshot(Map<String, dynamic> doc) {
    message = doc['message'];

    acceptedTime = doc['acceptedTime'];
  }

  NotificationModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    message = doc['message'];

    acceptedTime = doc['acceptedTime'];
  }
  Map<String, dynamic> toJson() => {
        'message': message,
        'acceptedTime': acceptedTime,
      };
}
