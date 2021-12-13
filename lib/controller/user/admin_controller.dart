import 'package:booky/controller/shops/shop_service.dart';
import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/model/request_model_admin.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();
  // late ProviderBusinessModel businessModel;
  RxBool isLoading = false.obs;
  var requests = <RequestModelAdmin>[].obs;
  getShops() async {
    requests.value = await ShopServices.getAllShops();
    isLoading.value = true;
    update();
  }




  
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
