import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/screens/customer/home_customer.dart';
import 'package:booky/utils/auth_exception_handler.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../theme.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();


  bool _obscureTextPassword = true;
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late String _email, _password;
  final authController = Get.find<AuthController>();

  void tryLogin() async {
    //Login user on auth request
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      final status = await authController.loginUser(
          _email, _password);

      print(status);

      if (status == AuthResultStatus.successful) {
        Get.offAll(HomeCustomer());
        // _updatestate(true);
        CustomSnackBar.showSnackBar(
            title: "Login Successful",
            message: '',
            backgroundColor: snackBarSuccess);
      } else {
        // _updatestate(true);
        final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
        CustomSnackBar.showSnackBar(
            title: errorMsg, message: '', backgroundColor: snackBarError);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
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
                  height: 190.0,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextFormField(
                              controller: loginEmailController,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (str){
                                setState(() {
                                  _email = str;
                                });
                              },
                              style: const TextStyle(
                                  // fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.envelope,
                                  color: kPrimaryColor,
                                  size: 18.0,
                                ),
                                hintText: 'Email Address',
                                hintStyle: TextStyle(
                                    // fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0),
                              ),
                              validator: (str) {
                                if (str == '') {
                                  return "Required*";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.height * 0.001,

                            // height: 1.0,
                            color: Colors.grey[400],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextFormField(
                              controller: loginPasswordController,
                              obscureText: _obscureTextPassword,
                              onChanged: (str){
                                setState(() {
                                  _password = str;
                                });
                              },
                              style: const TextStyle(
                                  // fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const Icon(
                                  FontAwesomeIcons.lock,
                                  size: 18.0,
                                  color: kPrimaryColor,
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                    // fontFamily: 'WorkSansSemiBold',
                                    fontSize: 16.0),
                                suffixIcon: GestureDetector(
                                  onTap: _toggleLogin,
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
                margin: const EdgeInsets.only(top: 170.0),
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
                      'Sign In',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 25.0,
                        // fontFamily: 'WorkSansBold'
                      ),
                    ),
                  ),
                  onPressed: tryLogin,
                  // onPressed: () => CustomSnackBar(
                  //     context, const Text('Login button pressed')),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
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

  // void _toggleSignInButton() {
  //   CustomSnackBar(context, const Text('Login button pressed'));
  // }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
