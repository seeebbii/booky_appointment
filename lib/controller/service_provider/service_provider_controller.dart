import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceProvider extends GetxController {


 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();

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

  // Future<bool> createAppoitmentInDatabase(Schedule schedule) async {
  //   try {
  //     Timestamp currentTime = Timestamp.now();
  //     DocumentReference document = _firestore.collection('available-appointments').doc();
  //     await document.set({
  //       "nurseId": authController.currentUser.value.uid,
  //       "schedule": schedule.toJson(),
  //       "createdAt": Timestamp.now(),
  //       "docId" : document.id
  //     });
  //     createAppointmentInNurseCollection(schedule, currentTime, document);
  //     CustomSnackBar.showSnackBar(
  //         title: "Appoitment successfully created",
  //         message: '',
  //         backgroundColor: snackBarSuccess);
  //     return true;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return false;
  //   }
  // }

  // @override
  // void onInit() {
  //   getProductList();
  //   super.onInit();
  // }
}
