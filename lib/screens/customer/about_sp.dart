import 'package:booky/constant.dart';
import 'package:flutter/material.dart';
import 'package:booky/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appointment_two.dart';

List serviceList = [
  {'title': 'Men Hair Cut', 'duration': 45, 'price': 30},
  {'title': 'Women Hair Cut', 'duration': 60, 'price': 50},
  {'title': 'Color & Blow Dry', 'duration': 90, 'price': 75},
  {'title': 'Oil Treatment', 'duration': 30, 'price': 20},
];

class AboutSpScreen extends StatelessWidget {
  static const String id = "AboutSpScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.only(left: 25, right: 25),
            child: Container(
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
                          Text("Abdullah Salon",
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
                          Text("0506101582",
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
                          Text("Location",
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
                SizedBox(
                  height: 90,
                ),
                MaterialButton(
                  padding: const EdgeInsets.fromLTRB(120, 8, 120, 8),
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
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
