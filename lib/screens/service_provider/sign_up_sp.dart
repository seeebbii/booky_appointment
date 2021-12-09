import 'package:booky/screens/customer/home_customer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme.dart';
import 'package:booky/screens/Login/snackbar.dart';

import 'location_sp.dart';

class SignUpSp extends StatefulWidget {
  const SignUpSp({Key? key}) : super(key: key);

  @override
  _SignUpSp createState() => _SignUpSp();
}

class _SignUpSp extends State<SignUpSp> {
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodePhone = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeName = FocusNode();
  final FocusNode focusNodeBusinessName = FocusNode();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();
  TextEditingController signupBusinessNameController = TextEditingController();

  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodePhone.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
    focusNodeBusinessName.dispose();
    super.dispose();
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
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20.0,
                                        left: 25.0,
                                        right: 25.0),
                                    child: TextField(
                                      focusNode: focusNodeBusinessName,
                                      controller: signupBusinessNameController,
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
                                      onSubmitted: (_) {
                                        focusNodeName.requestFocus();
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
                                    child: TextField(
                                      focusNode: focusNodeName,
                                      controller: signupNameController,
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
                                      onSubmitted: (_) {
                                        focusNodeEmail.requestFocus();
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
                                    child: TextField(
                                      focusNode: focusNodeEmail,
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
                                      onSubmitted: (_) {
                                        focusNodePassword.requestFocus();
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
                                    child: TextField(
                                      focusNode: focusNodePassword,
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
                                      onSubmitted: (_) {
                                        focusNodePhone.requestFocus();
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
                                    child: TextField(
                                      focusNode: focusNodePhone,
                                      controller: signupPhoneController,
                                      keyboardType: TextInputType.phone,
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
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => LocationSp())),
                            ),
                          ),
                        ],
                      ),
                    ],
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
