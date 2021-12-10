import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/controller/service_provider/service_provider_controller.dart';
import 'package:booky/screens/alerts.dart';
import 'package:get/get.dart';



class InitializeControllers{

  static void init(){
    Get.put(AuthController());
   
    
  }

  static void dispose(){
    // navigationController.dispose();
  }

}