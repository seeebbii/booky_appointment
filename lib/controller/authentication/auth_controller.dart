import 'package:booky/controller/service_provider/service_provider_controller.dart';
import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/utils/auth_exception_handler.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_database_service.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser.obs;
  // final spController =Get.put(ServiceProvider());

  var currentUser = AuthModel().obs;
  AuthResultStatus? _status;
  RxString role = "".obs;
  RxBool isActivated = false.obs;

  @override
  void onInit() {
    super.onInit();
    // BINDING AUTH LISTENER
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  // CHECKING DUPLICATE EMAIL
  Future<List<String>> checkDuplicateEmail(String email) async {
    try {
      return await _auth.fetchSignInMethodsForEmail(email);
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  Future getUserById(String uid) async {
    currentUser.value = await AuthDatabaseService().getUser(uid);
  }

  Future<String> firebaseToken() async {
    FirebaseMessaging fcm = FirebaseMessaging.instance;
    String? token = await fcm.getToken();
    if (token != '') {
      return token ?? "Failed";
    } else {
      return "Failed";
    }
  }

  //  CREATE USER WITH EMAIL AND PASSWORD
  Future<AuthResultStatus> createUser(
      String email,
      String password,
      String username,
      String phone,
      String role,
      String bName,
      int rating) async {
    try {
      String fcmToken = await firebaseToken();

      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      if (_authResult.user != null) {
        _status = AuthResultStatus.successful;
        AuthModel _user = AuthModel(
            uid: _authResult.user!.uid,
            username: username,
            email: email.trim(),
            status: "online",
            userCreatedDate: Timestamp.now(),
            role: role,
            fcmToken: fcmToken,
            businessName: bName,
            rating: rating,
            phoneNumber: phone,
            isActiveted: false,
            imageUrl: "");

        AuthDatabaseService()
            .createUserInDatabase(_user)
            .then((value) => debugPrint(value.toString()));

        currentUser.value = _user;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status!;
  }

  // Login with email and password
  Future<AuthResultStatus> loginUser(String email, String password) async {
    try {
      String fcmToken = await firebaseToken();
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);

      if (_authResult.user != null) {
        _status = AuthResultStatus.successful;

        AuthModel _user = AuthModel(
          uid: _authResult.user!.uid,
          email: email.trim(),
        );

        // UPDATE FCM TOKEN
        AuthDatabaseService().updateFcmToken(fcmToken, _user.uid!);

        // TODO :: LOAD USER INFO FROM FIRESTORE COLLECTION

        currentUser.value =
            await AuthDatabaseService().getUser(_authResult.user!.uid);

        // currentUser.value = _user;
        saveUserState(_authResult.user!.uid, currentUser.value.role.toString(),
            currentUser.value.isActiveted);
      } else {
        _status = AuthResultStatus.undefined;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status ?? AuthResultStatus.undefined;
  }

  // LOGOUT
  void logOut() async {
    try {
      await _auth.signOut();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('uid');
      prefs.remove('role');
      prefs.remove('isActivated');
      // Get.offAll(() => Login());
    } catch (e) {
      CustomSnackBar.showSnackBar(
          title: e.toString(), message: '', backgroundColor: snackBarError);
    }
  }

  void saveUserState(String uid, String role, bool? isActivated) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('SAVE IN LOCAL DB : ' + uid);
    debugPrint('SAVE IN LOCAL DB : ' + role);
    debugPrint('SAVE IN LOCAL Activated : ' + role);
    prefs.setString('uid', uid);
    prefs.setString('role', role);
    prefs.setBool('isActivated', isActivated!);
  }

  Future getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    role.value = prefs.getString('role').toString();
    isActivated.value = prefs.getBool('isActivated')!;
    print(role.value);
    return prefs.getString('uid');
  }
}
