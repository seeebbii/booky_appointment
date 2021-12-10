import 'package:booky/model/provider_business_model.dart';
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
  
 
  late ProviderBusinessModel businessModel;
  List<Availableday> availabledays=[];
  Map<int,String> categoryChoice=
  {
    0:'Car Wash',
    1:'Womens Saloon',
    2:'BarberShop',
    3:'Trainer',
    4:'Other',
  };
  var change;
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
