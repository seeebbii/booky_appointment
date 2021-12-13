import 'package:booky/model/appointments_model.dart';
import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/model/request_model_admin.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();
  var bookedAppointments = <AppointmentsModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getBookedAppointments() async {
    List<AppointmentsModel> appointments = [];
    CollectionReference reference =
        FirebaseFirestore.instance.collection('appointments');
    QuerySnapshot querySnapshot = await reference.get();
    final fetchQueryData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(fetchQueryData);

    fetchQueryData.forEach((element) {
      appointments.add(AppointmentsModel.fromDocumentSnapshot(
          element as Map<String, dynamic>));
    });
    bookedAppointments.value = appointments;
    print(bookedAppointments.length);
    isLoading.value = true;
    update();
  }

  Future<bool> createAppointmentRequest({
    required RequestModelAdmin? requestModelAdmin,
    required DateTime? selectedDate,
    required String? selectedTime,
  }) async {
    try {
      DocumentReference document = _firestore.collection('appointments').doc();
      await document.set({
        "uid": authController.currentUser.value.toJson(),
        "appointment-time": selectedTime,
        "appointment-date": selectedDate?.toIso8601String(),
        "appointment-details": requestModelAdmin?.toJson(),
        "createdAt": Timestamp.now(),
        "status":'booked',
        "docId": document.id,
      });
      print(document.id);
      CustomSnackBar.showSnackBar(
          title: "Appointment submitted successfully",
          message: '',
          backgroundColor: snackBarSuccess);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
