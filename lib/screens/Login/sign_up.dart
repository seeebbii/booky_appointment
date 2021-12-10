import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/screens/customer/home_customer.dart';
import 'package:booky/screens/service_provider/sign_up_sp.dart';
import 'package:booky/utils/auth_exception_handler.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = false;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();

  late String _email, _password, _username, _phone;
  final authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  void trySignup() async {
    //Login user on auth request
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      final status = await authController.createUser(
          _email, _password, _username, _phone, "customer", "", 0);
      if (status == AuthResultStatus.successful) {
        CustomSnackBar.showSnackBar(
            title: "Account created Successfully",
            message: '',
            backgroundColor: snackBarSuccess);
      } else {
        final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
        CustomSnackBar.showSnackBar(
            title: errorMsg, message: '', backgroundColor: snackBarError);
      }
    }
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
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
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.5,
                  // width: 300.0,
                  // height: 400.0,
                  child: Form(
                    key: _formKey,
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
                              onChanged: (str) {
                                _username = str;
                              },
                              controller: signupNameController,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
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
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    // fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0),
                              ),
                              validator: (str) {
                                if (str!.length< 4) {
                                  return "At least 4 character";
                                }
                                return null;
                              },
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
                              onChanged: (str) {
                                _email = str;
                              },
                              controller: signupEmailController,
                              keyboardType: TextInputType.emailAddress,
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
                              validator: (str) {
                                if (str== '') {
                                  return "Required*";
                                }
                                return null;
                              },
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
                              onChanged: (str) {
                                _password = str;
                              },
                              controller: signupPasswordController,
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
                              validator: (str) {
                                if (str!.length < 8) {
                                  return "At least 8 character";
                                }
                                return null;
                              },
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
                              onChanged: (str) {
                                _phone = str;
                              },
                              controller: signupPhoneController,
                              keyboardType: TextInputType.phone,
                              obscureText: _obscureTextConfirmPassword,
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
                              validator: (str) {
                                if (str == '') {
                                  return "Required*";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.go,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 360.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                      borderRadius: BorderRadius.circular(20)),
                  color: kPrimaryColor,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        // fontFamily: 'WorkSansBold'
                      ),
                    ),
                  ),
                  onPressed: trySignup,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: TextButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignUpSp())),
                child: const Text(
                  'Sign Up as a Service Provider?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor,
                    fontSize: 16.0,
                    // fontFamily: 'WorkSansMedium'
                  ),
                )),
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
