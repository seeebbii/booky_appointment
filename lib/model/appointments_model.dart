import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:booky/model/request_model_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentsModel {
  String? appointmentdate;
  String? appointmenttime;
  String? docId;
  Timestamp? createdAt;
  RequestModelAdmin? appointmentsDetails;
  AuthModel? user;
  String? status;



  AppointmentsModel({
    this.appointmentdate,
    this.appointmenttime,
    this.docId,
    this.appointmentsDetails,
    this.user,
    this.createdAt,
    this.status,
  });

  AppointmentsModel.fromDocumentSnapshot(Map<String, dynamic> doc) {
    try {
      appointmentdate = doc['appointment-date'];
      appointmenttime = doc['appointment-time'];
      docId = doc['appointment-date'];
      createdAt = doc['createdAt'];
      appointmentsDetails =
          RequestModelAdmin.fromDocumentSnapshot(doc['appointment-details']);
      user = AuthModel.fromMapSnapshot(doc['uid']);
      status = doc['status'] ?? "";
    } catch (e) {
      print(e.toString());
    }
  }

  Map<String, dynamic> toJson() => {
        'appointment-date': appointmentdate,
        'appointment-time': appointmenttime,
        'docId': docId,
        'appointment-details': appointmentsDetails?.toJson(),
        'user': user?.toJson(),
        'createdAt': createdAt,
        'status': status
      };
}
