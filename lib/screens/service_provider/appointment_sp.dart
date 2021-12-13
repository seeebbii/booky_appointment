import 'package:booky/controller/appointment/appointment_controller.dart';
import 'package:booky/model/appointments_model.dart';
import 'package:booky/screens/alerts.dart';
import 'package:booky/screens/customer/notification.dart';
import 'package:booky/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class AppointmentServiceProvider extends StatefulWidget {
  static String id = "AppointmentServiceProvider";
  final title = 'Notification';

  @override
  _AppointmentServiceProvider createState() => _AppointmentServiceProvider();
}

class _AppointmentServiceProvider extends State<AppointmentServiceProvider> {
  final _ = Get.find<AppointmentController>();

  @override
  void initState() {
    
    _.getBookedAppointments();
    print(_.authController.userid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: kWhiteColor,
        backgroundColor: Colors.white,
        body: Obx(() => _.isLoading.value
            ? Stack(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.only(top: 60.0),
                    itemCount: _.bookedAppointments.length,
                    itemBuilder: (context, index) {
                      return _.bookedAppointments[index].user!.uid ==
                              "S9HyFORUZVYZ9ioaGpHL4Iu9abU2"
                          //   _.authController.userid.value

                          ? Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    _.bookedAppointments[index].appointmentdate
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 70,
                                // ),
                                Image(
                                  height: 100,
                                  width: 100,
                                  image: AssetImage(
                                      "assets/images/Calendar_Flatline.png"),
                                ),
                                Text(
                                    "${_.bookedAppointments[index].appointmentsDetails!.shop!.status} Appointments"),
                                Divider(
                                  thickness: .1,
                                  height: 20,
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          : SizedBox.shrink();
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
                      top:
                          MediaQuery.of(context).size.height * 0.82797302637945,
                      left: MediaQuery.of(context).size.width * 0.048,
                      right: MediaQuery.of(context).size.width * 0.048,
                    ),
                  ),
                ],
              )
            : SizedBox.shrink()));
  }
}

// final days = [
//   'Saturday, 30 Oct',
//   'Sunday, 31 Oct',
//   'Monday, 1 Nov ',
//   'Tuesday, 2 Nov',
//   'Wednesday, 3 Nov',
//   'Thursday, 4 Nov',
//   'Friday 5 Nov',
// ];
