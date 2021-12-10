import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:booky/model/request_model_admin.dart';
import 'package:booky/screens/about_app.dart';
import 'package:booky/screens/customer/services_%20appointment.dart';
import 'package:booky/screens/customer/upcomings.dart';
import 'package:booky/theme.dart';

import 'Previous.dart';
import 'about_sp.dart';
import 'appointment_two.dart';

// List serviceList = [
//   {'title': 'Men Hair Cut', 'duration': 45, 'price': 30},
//   {'title': 'Women Hair Cut', 'duration': 60, 'price': 50},
//   {'title': 'Color & Blow Dry', 'duration': 90, 'price': 75},
//   {'title': 'Oil Treatment', 'duration': 30, 'price': 20},
// ];

class AppointmentOne extends StatelessWidget {
  static String id = "AppointmentOne";
  final RequestModelAdmin requestModelAdmin;
  const AppointmentOne({
    Key? key,
    required this.requestModelAdmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool status = false;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3 + 20,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  'assets/images/pic_one.jpg',
                  fit: BoxFit.fill,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: kPrimaryColor.withOpacity(0.2),
                  // color: Colors.green.withOpacity(0.1)
                ),
              ],
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width / 5,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 - 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 25, top: 270, right: 25),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: status ? Colors.green : Colors.red,
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(requestModelAdmin.user!.username.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            // fontFamily: "Raleway"
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .03
                            // 0.2007526162439146800501882,
                            ),
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Color(0xffFFC300),
                      ),
                      Text(
                        requestModelAdmin.user!.rating.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 280.0, top: 235),
            child: MaterialButton(
              onPressed: () {},
              padding: const EdgeInsets.all(10),
              shape: const CircleBorder(),
              color: Colors.white,
              child: const Icon(Icons.favorite,
                  color: kSecondaryColor, size: 24.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .45,
                left: MediaQuery.of(context).size.height * .045),
            child: Column(children: [
              // Row(
              //   children: [
              //     Text(
              //       "Information:",
              //       style: TextStyle(
              //           fontSize: 25,
              //           fontWeight: FontWeight.w800,
              //           color: kPrimaryTextColor),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            FontAwesomeIcons.cut,
                            size: 20,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      Divider(
                        height: MediaQuery.of(context).size.height * 0.04,
                        thickness: 1,
                        endIndent: 25,
                        color: kAppDividerColor,
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
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            FontAwesomeIcons.phone,
                            size: 20,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      Divider(
                        height: MediaQuery.of(context).size.height * 0.03,
                        thickness: 1,
                        endIndent: 25,
                        color: kAppDividerColor,
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
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.location_pin,
                            size: 20,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Business Name",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            )),
                        Text(requestModelAdmin.shop!.shopName.toString(),
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              // fontFamily: "Raleway"
                            )),
                        Divider(
                          height: MediaQuery.of(context).size.height * 0.04,
                          thickness: 1,
                          endIndent: 25,
                          color: kAppDividerColor,
                        ),
                        Text("Phone number",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              // fontWeight: FontWeight.w400,
                              // fontFamily: "Raleway"
                            )),
                        Text(requestModelAdmin.user!.phoneNumber.toString(),
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              // fontFamily: "Raleway"
                            )),
                        Divider(
                          height: MediaQuery.of(context).size.height * 0.04,
                          thickness: 1,
                          endIndent: 25,
                          color: kAppDividerColor,
                        ),
                        Text(requestModelAdmin.shop!.shoplocation.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              // fontWeight: FontWeight.w400,
                              // fontFamily: "Raleway"
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * .055,
              top: MediaQuery.of(context).size.height * .88,
            ),
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(120, 5, 120, 5),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AppointmentCustomerTwo())),
              color: const Color(0xff28676E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
