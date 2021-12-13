import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/screens/alerts.dart';
import 'package:booky/screens/contactUs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import '../about_app.dart';
import 'Appoinments.dart';
import 'notification.dart';

class SettingCustomer extends StatefulWidget {
  static String id = "SettingCustomer";
  const SettingCustomer({Key? key}) : super(key: key);

  @override
  _SettingCustomer createState() => _SettingCustomer();
}

class _SettingCustomer extends State<SettingCustomer> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF20474D),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15793),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.302637945,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.11,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Image(
                        image: AssetImage("assets/images/non-active-user.png"),
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => Text(
                      "Welcome ${authController.currentUser.value.username}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )))
                ],
              ),
            ),
            Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 250.0, left: 5),
                  itemCount: cusLabels.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70),
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 0.35,
                      shadowColor: kWhiteColor,
                      child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: kBlackColor,
                        ),
                        leading: Icon(
                          icons[index],
                          size: 20,
                          color: kPrimaryColor,
                        ),
                        title: Text(cusLabels[index]),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            switch (cusLabels[index]) {
                              case 'Edit Profile':
                                return NotificationCustomer();
                                break;
                              case 'About Application':
                                return AboutApplication();
                                break;

                              case 'Need Help?':
                                return ContactUs();
                                break;
                              // case 'Call Center':
                              //   return CallCenter();
                              // case 'About Application':
                              //   return About();
                              //   break;
                              default:
                                return SettingCustomer();
                            }
                          }),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            // Divider(
            //   height: 100,
            //   indent: 10,
            //   endIndent: 10,
            //   color: Colors.black,
            // ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.75,
                left: MediaQuery.of(context).size.width * 0.048,
                right: MediaQuery.of(context).size.width * 0.048,
              ),
              child: InkWell(
                onTap: () {
                  
                  logoutAlert(context);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  decoration: BoxDecoration(
                    color: Color(0xffEAEDED),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Color(0xff6A6A6A),
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

final cusLabels = [
  'Edit Profile',
  'About Application',
  'Need Help?',
];

final icons = [
  FontAwesomeIcons.idCard,
  Icons.info,
  FontAwesomeIcons.questionCircle
];





//     return Scaffold(
//         backgroundColor: Color(0xFF20474D),
//         body: Stack(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.15793),
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.9,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(30),
//                     topLeft: Radius.circular(30),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 left: MediaQuery.of(context).size.width * 0.302637945,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.11,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 5,
//                           blurRadius: 10,
//                           offset: Offset(0, 0),
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(20),
//                       child: Image(
//                         image: AssetImage("assets/images/non-active-user.png"),
//                         width: MediaQuery.of(context).size.width * 0.15,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text("Welcome Fahad ",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w400,
//                           ))
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).size.height * 0.82797302637945,
//                 left: MediaQuery.of(context).size.width * 0.048,
//                 right: MediaQuery.of(context).size.width * 0.048,
//               ),
//               child: InkWell(
//                 onTap: () {},
//                 child: Container(
//                   height: MediaQuery.of(context).size.height * 0.065,
//                   decoration: BoxDecoration(
//                     color: Color(0xffEAEDED),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.logout_outlined),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "Logout",
//                         style: TextStyle(
//                           color: Color(0xff6A6A6A),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
