import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceProvider extends GetxController {
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();
  TextEditingController signupBusinessNameController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  RxInt choise = 0.obs;
  // var optionSelected = false.obs;
  // var productSelected = false.obs;

  // void getProductList() async {
  //   productModel.value = await ApiClient.productService.getProduct();
  // }

  // @override
  // void onInit() {
  //   getProductList();
  //   super.onInit();
  // }
}
