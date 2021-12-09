import 'package:booky/screens/customer/card.dart';
import 'package:booky/screens/service_provider/business_hours_one.dart';
import 'package:booky/screens/service_provider/profile_sp.dart';
import 'package:flutter/material.dart';
import 'package:booky/screens/customer/Previous.dart';
import 'package:booky/screens/customer/setting.dart';
import 'package:booky/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant.dart';
import 'card.dart';
import 'notification.dart';

class UpcomingAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(bottom: 10.0),
          itemCount: BusinessNames.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    BusinessNames[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
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
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              FontAwesomeIcons.calendarAlt,
                              size: 18,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        Text(days[index],
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
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
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              FontAwesomeIcons.clock,
                              size: 18,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        Text(time[index],
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
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
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.location_pin,
                              size: 18,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xff6A6A6A),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 5.0),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              // fontFamily: 'WorkSansBold'
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => BusinessHoursOne())),
                      ),
                    ),
                    Container(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: kPrimaryColor,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(
                            'Reschedule',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              // fontFamily: 'WorkSansBold'
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => BusinessHoursOne())),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: .1,
                  height: 30,
                  endIndent: 10,
                  color: Colors.black,
                ),
              ],
            );
          },
        ),

        // Divider(
        //   height: 100,
        //   indent: 10,
        //   endIndent: 10,
        //   color: Colors.black,
        // ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.82797302637945,
            left: MediaQuery.of(context).size.width * 0.048,
            right: MediaQuery.of(context).size.width * 0.048,
          ),
        ),
      ],
    ));
  }
}

final BusinessNames = [
  'Abdullah Salon',
  'Fahad Car Wash',
  'Mohammed Womans Salon',
  'Mohsen Trainer',
];
final days = [
  'Monday, 8 Nov',
  'Tuesday, 9 Nov',
  'Wendsday, 10 Nov',
  'Thursday, 11 Nov'
];

final time = ['7:30 AM', '10:30 AM', '12:00 PM', '2:00 PM'];

final spImages = [kSpImagesOne, kSpImagesTwo, kSpImagesThree, kSpImagesOne];      

        // Image.asset(
        //   kAppointment,
        //   height: MediaQuery.of(context).size.height / 3,
        //   width: MediaQuery.of(context).size.width,
        // ),
        // const SizedBox(height: 10),
        // const Align(
        //     child: Text(
        //   "You don't have Appointments!",
        //   textAlign: TextAlign.center,
        //   style: TextStyle(color: kPrimaryTextColor, fontSize: 20),
        // )),
        // const SizedBox(height: 30),

        // Positioned(
        //   child: MaterialButton(
        //     padding: const EdgeInsets.all(20),
        //     onPressed: () => Navigator.of(context).push(
        //         MaterialPageRoute(builder: (context) => CardScreen())),
        //     color: kAppointmentColor,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     child: const Text(
        //       'Book Your Appoinment Now!',
        //       style: TextStyle(color: Colors.white, fontSize: 24),
        //     ),
        //   ),
        // ),
