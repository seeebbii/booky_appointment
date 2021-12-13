import 'package:booky/controller/appointment/appointment_controller.dart';
import 'package:booky/screens/customer/Previous.dart';
import 'package:booky/screens/customer/setting.dart';
import 'package:booky/screens/customer/upcomings.dart';
import 'package:booky/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'card.dart';
import 'notification.dart';

class Appoinments extends StatefulWidget {
  static String id = "Appoinments";
  const Appoinments({Key? key}) : super(key: key);

  @override
  _Appoinments createState() => _Appoinments();
}

class _Appoinments extends State<Appoinments> {
  final _ = Get.find<AppointmentController>();

  @override
  void initState() {
    _.getBookedAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20474D),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15793),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                ),
              ),
              Row(
                children: const [
                  Padding(padding: EdgeInsets.fromLTRB(100, 120, 0, 40)),
                  Text("Appointments",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kWhiteColor,
                          // fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontSize: 28.0)),
                ],
              ),
              // Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Image.asset(
              //         kAppointment,
              //         height: MediaQuery.of(context).size.height / 3,
              //         width: MediaQuery.of(context).size.width,
              //       ),
              //       const SizedBox(height: 10),
              //       const Align(
              //           child: Text(
              //         "You don't have Appointments!",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(color: kPrimaryTextColor, fontSize: 20),
              //       )),
              //       const SizedBox(height: 30),
              //       Positioned(
              //         child: MaterialButton(
              //           padding: const EdgeInsets.all(20),
              //           onPressed: () => Navigator.of(context).push(
              //               MaterialPageRoute(
              //                   builder: (context) => CardScreen())),
              //           color: const Color(kAppointmentColor),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(15),
              //           ),
              //           child: const Text(
              //             'Book Your Appoinment Now!',
              //             style: TextStyle(color: Colors.white, fontSize: 24),
              //           ),
              //         ),
              //       ),
              //     ]),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    DefaultTabController(
                      length: 2,
                      child: Expanded(
                        child: Column(
                          children: [
                            TabBar(
                              indicatorColor: kAppointmentColor,
                              unselectedLabelColor: Color(0xFF555555),
                              labelColor: kAppointmentColor,
                              // labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                              tabs: [
                                Tab(
                                  text: "Previous",
                                ),
                                Tab(
                                  text: "Upcoming",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Obx(() => _.isLoading.value
                                ? Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.5,
                                    child: TabBarView(
                                      children: [
                                        PreviousAppointments(previous: _.previousAppointments,),
                                        UpcomingAppointments(upcoming:_.upcomingAppointments),
                                      ],
                                    ),
                                  )
                                : SizedBox.shrink()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
