import 'dart:io';

import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/screens/customer/home_customer.dart';
import 'package:booky/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Login/login_page.dart';

final authController = Get.find<AuthController>();

ChoosingHoursAlert(ctx, String day) {
  showDialog(
      context: ctx,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            height: MediaQuery.of(ctx).size.height * 0.353103448,
            width: 310,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 310,
                      height: MediaQuery.of(ctx).size.height * 0.0653103448,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(20)),
                        color: kPrimaryColor,
                      ),
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       bottom: MediaQuery.of(ctx).size.height * 0.00103448,
                //       // bottom: MediaQuery.of(ctx).size.height * 0.01103448,
                //       ),
                //   child: Text(
                //     day,
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(ctx).size.height * 0.0293448,
                  ),
                  child: Text(
                    "jkhkuguk",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: kAppDividerColor,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 6.0),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Color(0xff25272A),
                              fontSize: 16.0,
                              // fontFamily: 'WorkSansBold'
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ),
                    Container(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xff25272A),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 6.0),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              // fontFamily: 'WorkSansBold'
                            ),
                          ),
                        ),
                        onPressed: () {
                          //lkmsel
                          //fs,lf
                          //elfmw
                          Navigator.pop(ctx);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).then((exit) {});
}

failedAlert(ctx) {
  showDialog(
      context: ctx,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            height: MediaQuery.of(ctx).size.height * 0.253103448,
            width: 310,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 310,
                      height: MediaQuery.of(ctx).size.height * 0.0653103448,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(20)),
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(ctx).size.height * 0.01103448,
                  ),
                  child: Text(
                    "Active First!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(ctx).size.height * 0.0293448,
                  ),
                  child: Text(
                    "You Should Active First!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xff25272A),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 6.0),
                          child: Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              // fontFamily: 'WorkSansBold'
                            ),
                          ),
                        ),
                        onPressed: () {
                          //lkmsel
                          //fs,lf
                          //elfmw
                          Navigator.pop(ctx);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).then((exit) {});
}

// EmailAlert(ctx) {
//   showDialog(
//       context: ctx,
//       builder: (_) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(0),
//                 topRight: Radius.circular(20),
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//             ),
//             height: MediaQuery.of(ctx).size.height * 0.353103448,
//             width: 310,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       width: 310,
//                       height: MediaQuery.of(ctx).size.height * 0.0653103448,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(0),
//                             topRight: Radius.circular(20)),
//                         color: kPrimaryColor,
//                       ),
//                       child: Text(
//                         "Contact with us",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(ctx).size.height * 0.0293448,
//                   ),
//                   child: Text(
//                     "Boooky.App@gmail.com",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 75,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       child: MaterialButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         color: kAppDividerColor,
//                         // onPressed: () {},
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 2.0, horizontal: 6.0),
//                           child: Text(
//                             'Cancel',
//                             style: TextStyle(
//                               color: Color(0xff25272A),
//                               fontSize: 16.0,
//                             ),
//                           ),
//                         ),
//                         onPressed: () => Navigator.pop(ctx),
//                       ),
//                     ),
//                     Container(
//                       child: MaterialButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         color: Color(0xff25272A),
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 2.0, horizontal: 6.0),
//                           child: Text(
//                             'Save',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.0,
//                             ),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pop(ctx);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       }).then((exit) {});
// }

//  EmailAlert(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         title: new Text("Alert!!"),
//         content: new Text("You are awesome!"),
//         actions: <Widget>[
//            MaterialButton(
//             child: new Text("OK"),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

logoutAlert(ctx) {
  showDialog(
      context: ctx,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            height: MediaQuery.of(ctx).size.height * 0.253103448,
            width: 310,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 310,
                      height: MediaQuery.of(ctx).size.height * 0.0653103448,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(20)),
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(ctx).size.height * 0.01103448,
                  ),
                  child: Text(
                    "Are ou Sure you want to Loguot ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "If you press Yes, you will be logged out of your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xff25272A),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 6.0),
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              // fontFamily: 'WorkSansBold'
                            ),
                          ),
                        ),
                        onPressed: () {
                          //lkmsel
                          //fs,lf
                          //elfmw
                          authController.logOut();
                          Get.offAll(LoginPage());

                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).then((exit) {});
}
