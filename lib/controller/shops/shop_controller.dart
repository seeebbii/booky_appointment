import 'package:booky/controller/shops/shop_service.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authController = Get.find<AuthController>();
  late ProviderBusinessModel businessModel;

  getAllShop() async {
//  currentUser.value =
//             await ShopServices().getAllShops();

  }

  @override
  void onInit() {
    getAllShop();
    super.onInit();
  }
}
