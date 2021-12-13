import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/model/request_model_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();
  Stream<List<RequestModelAdmin>> getAllShops() {
    return _firestore
        .collection('serviceProvider-shop')
        .snapshots()
        .map((snapshot) {
      List<RequestModelAdmin> collection = [];

      final allData = snapshot.docs.map((doc) => doc.data()).toList();
      allData.forEach((element) {
        collection.add(RequestModelAdmin.fromDocumentSnapshot(
            element as Map<String, dynamic>));
      });

      return collection;
    });
  }
}
