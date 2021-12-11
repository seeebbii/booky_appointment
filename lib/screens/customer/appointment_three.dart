import 'dart:convert';

import 'package:booky/controller/appointment/appointment_controller.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:booky/model/request_model_admin.dart';
import 'package:booky/screens/service_provider/profile_sp.dart';
import 'package:booky/theme.dart';
import 'package:get/get.dart';

import 'appointment_two.dart';
import 'conformation_appointment.dart';

class AppointmentCustomerThree extends StatefulWidget {
  static String ? id = "AppointmentCustomerThree";
  final RequestModelAdmin? requestModelAdmin;
  final DateTime? selectedDate;
  final String ?selectedTime;
  const AppointmentCustomerThree({
    Key? key,
     this.requestModelAdmin,
     this.selectedDate,
     this.selectedTime,
  }) : super(key: key);

  @override
  State<AppointmentCustomerThree> createState() =>
      _AppointmentCustomerThreeState();
}

class _AppointmentCustomerThreeState extends State<AppointmentCustomerThree> {
  var appointmentController = Get.find<AppointmentController>();
  createAppoitment() async {
    if (await appointmentController.createAppointmentRequest(
        requestModelAdmin: widget.requestModelAdmin,
        selectedDate: widget.selectedDate,
        selectedTime: widget.selectedTime)) {
      print("APPOINTMENTCREATE");
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ConformationAppointment()));
    } else {
      CustomSnackBar.showSnackBar(
          title: "APPOINTMENTCREATE CREATING FAILED",
          message: '',
          backgroundColor: snackBarError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
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
              height: MediaQuery.of(context).size.height / 5,
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
              top: MediaQuery.of(context).size.height / 3 - 20,
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
                // child: Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: ListView(children: [
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 25, top: 270, right: 25),
              child: Container(
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        "Appointment Details:",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: kPrimaryTextColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
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
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.text_snippet,
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
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                Icons.text_format,
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
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(
                                FontAwesomeIcons.calendarAlt,
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
                                  offset: Offset(
                                      0, 0), // changes position of shadow
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
                            Text("Service Category",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                )),
                            Text(
                                widget.requestModelAdmin!.shop!.businessCategory
                                    .toString(),
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  // fontFamily: "Raleway"
                                )),
                            Divider(
                              height: MediaQuery.of(context).size.height * 0.03,
                              thickness: 1,
                              endIndent: 25,
                              color: kAppDividerColor,
                            ),
                            Text("Business Name",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                )),
                            Text(
                                widget.requestModelAdmin!.shop!.shopName
                                    .toString(),
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  // fontFamily: "Raleway"
                                )),
                            Divider(
                              height: MediaQuery.of(context).size.height * 0.03,
                              thickness: 1,
                              endIndent: 25,
                              color: kAppDividerColor,
                            ),
                            Text("Date & Time",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  // fontWeight: FontWeight.w400,
                                  // fontFamily: "Raleway"
                                )),
                            Text(dateFormatter(widget.selectedDate!),
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
                            Text(
                                widget.requestModelAdmin!.shop!.shoplocation
                                    .toString(),
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  // fontFamily: "Raleway"
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.fromLTRB(120, 5, 120, 5),
                    onPressed: () {
                      createAppoitment();
                    },
                    color: const Color(0xff28676E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

  dynamic monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      date.year.toString();
}
//     return Scaffold(
//       body: Stack(
//         children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Stack(children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 3 + 20,
//                 width: MediaQuery.of(context).size.width,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: <Widget>[
//                     Image.asset(
//                       'assets/images/pic_one.jpg',
//                       fit: BoxFit.fill,
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height,
//                       color: kPrimaryColor.withOpacity(0.2),
//                       // color: Colors.green.withOpacity(0.1)
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 height: MediaQuery.of(context).size.height / 5,
//                 width: MediaQuery.of(context).size.width / 5,
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//               Positioned(
//                 top: MediaQuery.of(context).size.height / 3 - 20,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(30),
//                       topLeft: Radius.circular(30),
//                     ),
//                   ),
//                   // child: Padding(
//                   //   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   //   child: ListView(children: [
//                 ),
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 margin: EdgeInsets.only(left: 25, top: 270, right: 25),
//                 child: Container(
//                   child: Column(children: [
//                     Row(
//                       children: [
//                         Text(
//                           "Appointment Details:",
//                           style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.w800,
//                               color: kPrimaryTextColor),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     spreadRadius: 5,
//                                     blurRadius: 10,
//                                     offset: Offset(
//                                         0, 0), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.all(15),
//                                 child: Icon(
//                                   FontAwesomeIcons.cut,
//                                   size: 20,
//                                   color: kPrimaryColor,
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Text("Business Name",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                       // fontWeight: FontWeight.w400,
//                                       // fontFamily: "Raleway"
//                                     )),
//                                 // Padding(
//                                 //   padding: const EdgeInsets.only(left: 10),
//                                 // child:
//                                 Text("Abdullah Salon",
//                                     style: TextStyle(
//                                       color: kPrimaryColor,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                       // fontFamily: "Raleway"
//                                     )),
//                                 // )
//                               ],
//                             ),
//                           ],
//                         ),
//                         Divider(
//                           thickness: 1,
//                           endIndent: 25,
//                           color: kAppDividerColor,
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.01,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     spreadRadius: 5,
//                                     blurRadius: 10,
//                                     offset: Offset(
//                                         0, 0), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.all(15),
//                                 child: Icon(
//                                   FontAwesomeIcons.calendarAlt,
//                                   size: 20,
//                                   color: kPrimaryColor,
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 55.0),
//                                   child: Text("Date & Time",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 14,
//                                         // fontWeight: FontWeight.w400,
//                                         // fontFamily: "Raleway"
//                                       )),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: Text("Monday, 8 Nov 2021",
//                                       style: TextStyle(
//                                         color: kPrimaryColor,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         // fontFamily: "Raleway"
//                                       )),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.01,
//                         ),
//                         Divider(
//                           thickness: 1,
//                           endIndent: 25,
//                           color: kAppDividerColor,
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.01,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     spreadRadius: 5,
//                                     blurRadius: 10,
//                                     offset: Offset(
//                                         0, 0), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.all(15),
//                                 child: Icon(
//                                   FontAwesomeIcons.mix,
//                                   size: 20,
//                                   color: kPrimaryColor,
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 35.0),
//                                   child: Text("Services",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 14,
//                                         // fontWeight: FontWeight.w400,
//                                         // fontFamily: "Raleway"
//                                       )),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 20),
//                                   child: Text("- Cut Hair\n- Astshwar\n- 9nfrh",
//                                       style: TextStyle(
//                                         color: kPrimaryColor,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         // fontFamily: "Raleway"
//                                       )),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                         Divider(
//                           thickness: 1,
//                           endIndent: 25,
//                           color: kAppDividerColor,
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.01,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     spreadRadius: 5,
//                                     blurRadius: 10,
//                                     offset: Offset(
//                                         0, 0), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.all(15),
//                                 child: Icon(
//                                   FontAwesomeIcons.calendarAlt,
//                                   size: 20,
//                                   color: kPrimaryColor,
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 55.0),
//                                   child: Text("Total Price",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 14,
//                                         // fontWeight: FontWeight.w400,
//                                         // fontFamily: "Raleway"
//                                       )),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: Text('50 SR',
//                                       style: TextStyle(
//                                         color: kPrimaryColor,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         // fontFamily: "Raleway"
//                                       )),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                         Divider(
//                           thickness: 1,
//                           endIndent: 25,
//                           color: kAppDividerColor,
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.01,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.withOpacity(0.1),
//                                     spreadRadius: 5,
//                                     blurRadius: 10,
//                                     offset: Offset(
//                                         0, 0), // changes position of shadow
//                                   ),
//                                 ],
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.all(15),
//                                 child: Icon(
//                                   Icons.location_pin,
//                                   size: 20,
//                                   color: kPrimaryColor,
//                                 ),
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 12),
//                                   child: Text("Location",
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 16,
//                                         // fontWeight: FontWeight.w400,
//                                         // fontFamily: "Raleway"
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     MaterialButton(
//                       padding: const EdgeInsets.fromLTRB(120, 8, 120, 8),
//                       onPressed: () => Navigator.of(context).push(
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   AppointmentCustomerThree())),
//                       color: const Color(0xff28676E),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: const Text(
//                         'Confirm',
//                         style: TextStyle(color: Colors.white, fontSize: 26),
//                       ),
//                     ),
//                   ]),
//                 ),
//               ),
//             ]),
//           )
//         ],
//       ),
//     );
//   }
// }
