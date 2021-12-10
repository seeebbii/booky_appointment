import 'package:booky/model/provider_business_model.dart';
import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SPHomeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();
  late ProviderBusinessModel businessModel;

  getAppointments() {}

  // Future<AuthModel> getUser(String uid) async {
  //   try {
  //     DocumentSnapshot doc = await firestore.collection("auth").doc(uid).get();
  //     if (!doc.exists) {
  //       CustomSnackBar.showSnackBar(
  //           title: "Not Authorized",
  //           message: '',
  //           backgroundColor: snackBarError);
  //     }
  //     return AuthModel.fromDocumentSnapshot(doc);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     rethrow;
  //   }
  // }

  @override
  void onInit() {
    //  getProductList();
    super.onInit();
  }
}
