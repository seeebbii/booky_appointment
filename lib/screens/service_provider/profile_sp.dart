import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/screens/Login/login_page.dart';
import 'package:booky/screens/customer/notification.dart';
import 'package:booky/screens/customer/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class ProfileServiceProvider extends StatefulWidget {
  static String id = "ProfileServiceProvider";
  const ProfileServiceProvider({Key? key}) : super(key: key);

  @override
  _ProfileServiceProvider createState() => _ProfileServiceProvider();
}

class _ProfileServiceProvider extends State<ProfileServiceProvider> {
  final _ = Get.find<AuthController>();
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
                  Text("Welcome ${_.currentUser.value.username}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ))
                ],
              ),
            ),
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 250.0),
                  itemCount: spLabels.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 0.4,
                      shadowColor: kWhiteColor,
                      child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 22.0,
                          color: kBlackColor,
                        ),
                        leading: Icon(
                          icons[index],
                          size: 25,
                          color: kPrimaryColor,
                        ),
                        title: Text(spLabels[index]),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            switch (spLabels[index]) {
                              case 'Notifications':
                                return NotificationCustomer();
                                break;

                              case 'Setting Account':
                                return SettingCustomer();
                                break;
                              // case 'Call Center':
                              //   return CallCenter();
                              // case 'About Application':
                              //   return About();
                              //   break;
                              default:
                                return ProfileServiceProvider();
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
                  _.logOut();
                  Get.offAll(LoginPage());
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

final spLabels = [
  'Status',
  'Notifications',
  'Setting Account',
  'About Application',
];

final icons = [
  Icons.check,
  Icons.notifications,
  Icons.settings,
  Icons.info,
];
