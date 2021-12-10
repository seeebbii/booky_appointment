import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/controller/service_provider/service_provider_controller.dart';
import 'package:booky/utils/auth_exception_handler.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../theme.dart';
import 'location_sp.dart';

class SignUpSp extends StatefulWidget {
  const SignUpSp({Key? key}) : super(key: key);

  @override
  _SignUpSp createState() => _SignUpSp();
}

class _SignUpSp extends State<SignUpSp> {
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = false;
 final spController = Get.find<ServiceProvider>();



  //late String _businessName, _username, _email, _password, _phone;
  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  void trySignup() async {
    //Login user on auth request
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      Get.to(LocationSp());
      // final status = await authController.createUser(
      //   _email,
      //   _password,
      //   _username,
      //   _phone,
      //   "customer",
      // );
      // if (status == AuthResultStatus.successful) {
      //   CustomSnackBar.showSnackBar(
      //       title: "Account created Successfully",
      //       message: '',
      //       backgroundColor: snackBarSuccess);
      // } else {
      //   final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
      //   CustomSnackBar.showSnackBar(
      //       title: errorMsg, message: '', backgroundColor: snackBarError);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.37,
                    top: MediaQuery.of(context).size.width * 0.125),
                child: Image.asset("assets/images/logoWithoutName.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 150),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Card(
                              elevation: 2.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                width: 300.0,
                                height: 470.0,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                            left: 25.0,
                                            right: 25.0),
                                        child: TextFormField(
                                          validator: (str) {
                                            if (str == '') {
                                              return "Required*";
                                            }
                                            return null;
                                          },
                                          // onChanged: (str) {
                                          //   _businessName = str;
                                          // },
                                          controller: spController
                                              .signupBusinessNameController,
                                          keyboardType: TextInputType.text,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          autocorrect: false,
                                          style: const TextStyle(
                                              // fontFamily: 'WorkSansSemiBold' ,
                                              fontSize: 16.0,
                                              color: Colors.black),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            icon: Icon(
                                              FontAwesomeIcons.userCheck,
                                              size: 18,
                                              color: kPrimaryColor,
                                            ),
                                            hintText: 'Business Name',
                                            hintStyle: TextStyle(
                                                // fontFamily: 'WorkSansSemiBold',
                                                fontSize: 16.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 250.0,
                                        height: 1.0,
                                        color: Colors.grey[400],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                            left: 25.0,
                                            right: 25.0),
                                        child: TextFormField(
                                          validator: (str) {
                                            if (str == '') {
                                              return "Required*";
                                            }
                                            return null;
                                          },
                                          // onChanged: (str) {
                                          //   _username = str;
                                          // },
                                          controller:
                                              spController.signupNameController,
                                          keyboardType: TextInputType.text,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          autocorrect: false,
                                          style: const TextStyle(
                                              // fontFamily: 'WorkSansSemiBold' ,
                                              fontSize: 16.0,
                                              color: Colors.black),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            icon: Icon(
                                              FontAwesomeIcons.user,
                                              size: 18,
                                              color: kPrimaryColor,
                                            ),
                                            hintText: 'Your Name',
                                            hintStyle: TextStyle(
                                                // fontFamily: 'WorkSansSemiBold',
                                                fontSize: 16.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 250.0,
                                        height: 1.0,
                                        color: Colors.grey[400],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                            left: 25.0,
                                            right: 25.0),
                                        child: TextFormField(
                                          validator: (str) {
                                            if (str == '') {
                                              return "Required*";
                                            }
                                            return null;
                                          },
                                          // onChanged: (str) {
                                          //   _email = str;
                                          // },
                                          controller: spController
                                              .signupEmailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          autocorrect: false,
                                          style: const TextStyle(
                                              // fontFamily: 'WorkSansSemiBold',
                                              fontSize: 16.0,
                                              color: Colors.black),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            icon: Icon(
                                              FontAwesomeIcons.envelope,
                                              size: 18,
                                              color: kPrimaryColor,
                                            ),
                                            hintText: 'Email',
                                            hintStyle: TextStyle(
                                                // fontFamily: 'WorkSansSemiBold',
                                                fontSize: 16.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 250.0,
                                        height: 1.0,
                                        color: Colors.grey[400],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                            left: 25.0,
                                            right: 25.0),
                                        child: TextFormField(
                                          validator: (str) {
                                            if (str == '') {
                                              return "Required*";
                                            }
                                            return null;
                                          },
                                          // onChanged: (str) {
                                          //   _password = str;
                                          // },
                                          controller: spController
                                              .signupPasswordController,
                                          obscureText: _obscureTextPassword,
                                          autocorrect: false,
                                          style: const TextStyle(
                                              // fontFamily: 'WorkSansSemiBold',
                                              fontSize: 16.0,
                                              color: Colors.black),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            icon: const Icon(
                                              FontAwesomeIcons.lock,
                                              size: 18,
                                              color: kPrimaryColor,
                                            ),
                                            hintText: 'Password',
                                            hintStyle: const TextStyle(
                                                // fontFamily: 'WorkSansSemiBold',
                                                fontSize: 16.0),
                                            suffixIcon: GestureDetector(
                                              onTap: _toggleSignup,
                                              child: Icon(
                                                _obscureTextPassword
                                                    ? FontAwesomeIcons.eye
                                                    : FontAwesomeIcons.eyeSlash,
                                                size: 15.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 250.0,
                                        height: 1.0,
                                        color: Colors.grey[400],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0,
                                            bottom: 20.0,
                                            left: 25.0,
                                            right: 25.0),
                                        child: TextFormField(
                                          controller: spController
                                              .signupPhoneController,
                                          keyboardType: TextInputType.phone,
                                          // onChanged: (str) {
                                          //   _phone = str;
                                          // },
                                          validator: (str) {
                                            if (str == '') {
                                              return "Required*";
                                            }
                                            return null;
                                          },
                                          autocorrect: false,
                                          style: const TextStyle(
                                              // fontFamily: 'WorkSansSemiBold',
                                              fontSize: 14.0,
                                              color: Colors.black),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            icon: const Icon(
                                              FontAwesomeIcons.phone,
                                              size: 18,
                                              color: kPrimaryColor,
                                            ),
                                            hintText: 'Phone',
                                            hintStyle: const TextStyle(
                                                // fontFamily: 'WorkSansSemiBold',
                                                fontSize: 16.0),
                                          ),
                                          // onSubmitted: (_) {
                                          //   _toggleSignUpButton();
                                          // },
                                          textInputAction: TextInputAction.go,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 450.0),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: CustomTheme.loginGradientStart,
                                    offset: Offset(1.0, 6.0),
                                    blurRadius: 20.0,
                                  ),
                                  BoxShadow(
                                    color: CustomTheme.loginGradientEnd,
                                    offset: Offset(1.0, 6.0),
                                    blurRadius: 20.0,
                                  ),
                                ],
                                gradient: LinearGradient(
                                    colors: <Color>[
                                      CustomTheme.loginGradientEnd,
                                      CustomTheme.loginGradientStart
                                    ],
                                    begin: FractionalOffset(0.2, 0.2),
                                    end: FractionalOffset(1.0, 1.0),
                                    stops: <double>[0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: kPrimaryColor,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 60.0),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      // fontFamily: 'WorkSansBold'
                                    ),
                                  ),
                                ),
                                onPressed: trySignup,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // void _toggleSignUpButton() {
  //   CustomSnackBar(context, const Text('SignUp button pressed'));
  // }

  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }
}
