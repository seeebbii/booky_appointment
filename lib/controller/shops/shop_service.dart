import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/controller/authentication/auth_database_service.dart';
import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/model/request_model_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ShopServices {
  RequestModelAdmin? request;

  static getAllShops() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    var currentUser = AuthModel().obs;
    List<RequestModelAdmin>? collection;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('serviceProvider-shop');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    var collect = [];
    // RequestModelAdmin.fromDocumentSnapshot(allData);
    print(allData);
    allData.forEach((element) async {
      collect.add(RequestModelAdmin.fromDocumentSnapshot(
          element as Map<String, dynamic>));
      print(element['uid']);
      DocumentSnapshot doc =
          await firestore.collection("auth").doc(element['uid']).get();
      currentUser.value = AuthModel.fromDocumentSnapshot(doc);
      print(currentUser.value.username);
    });
    // try {
    //   CollectionReference <Map<String, dynamic>> doc =  _firestore.collection("serviceProvider-shop");

    //   if (!doc.isEmpty) {
    //     CustomSnackBar.showSnackBar(
    //         title: "Not Authorized",
    //         message: '',
    //         backgroundColor: snackBarError);
    //   }
    //   return AuthModel.fromDocumentSnapshot(doc);
    // } catch (e) {
    //   debugPrint(e.toString());
    //   rethrow;
    // }
  }
}
