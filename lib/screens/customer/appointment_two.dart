import 'dart:convert';

import 'package:booky/controller/appointment/appointment_controller.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:booky/model/request_model_admin.dart';
import 'package:booky/theme.dart';

import 'appointment_three.dart';

class AppointmentCustomerTwo extends StatefulWidget {
  static String id = "AppointmentCustomerTwo";
  final RequestModelAdmin? requestModelAdmin;
  final bool? isReschedule;
  final String? rescheduleDocId;
  const AppointmentCustomerTwo({Key? key, this.requestModelAdmin, this.isReschedule = false, this.rescheduleDocId = ''})
      : super(key: key);

  @override
  _AppointmentCustomerTwoState createState() => _AppointmentCustomerTwoState();
}

class _AppointmentCustomerTwoState extends State<AppointmentCustomerTwo> {
  var appointmentController = Get.put(AppointmentController());
  var dateparse;
  List<Availableday> availabledays = [];

  // List<String> availabletime=[];
  late String weekday;
  bool isProvideravailable = true;
  bool isSelectionValid = false;
  List<String> showavailable = [];

  void initState() {
    getdatetime();
    super.initState();
  }

  List<Appointments> appointments = [];
  DatePickerController _controller = DatePickerController();
  String selectedTime = "";
  DateTime _selectedValue = DateTime.now();
  late Appointments _availableslot =
      new Appointments(time: '', isSelected: false);

  int choise = 0;

  @override
  Widget build(BuildContext context) {
    //  getdatetime();
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
              ),
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   margin: EdgeInsets.only(left: 20, top: 280),

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 15, top: 250),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Select Day',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: kPrimaryTextColor),
                    ),
                    Text(
                      dateFormatter(_selectedValue),
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Container(
                      child: DatePicker(
                        DateTime.now(),
                        width: 60,
                        height: 120,
                        controller: _controller,

                        selectionColor: isSelectionValid
                            ? Color(0xff28676E)
                            : Colors.transparent,
                        selectedTextColor:
                            isSelectionValid ? Colors.white : Colors.black,
                        // activeDates: [

                        // ],
                        inactiveDates: [],
                        onDateChange: (date) {
                          print(DateFormat('EEEE').format(date));
                          isProvideravailable = checkavailibility(date);
                          if (isProvideravailable == true) {
                            setState(() {
                              availabledays.forEach((element) {
                                if (element.dayName!.toLowerCase() ==
                                    DateFormat(
                                            'EEEE')
                                        .format(date)
                                        .toLowerCase())
                                  _availableslot = new Appointments(
                                      time:
                                          '${element.fromTime}-${element.toTIme}',
                                      isSelected: false);
                              });

                              _selectedValue = date;

                              isSelectionValid = true;
                            });
                          } else {
                            setState(() {
                              // ignore: unnecessary_statements
                              _availableslot.time = '';
                              isSelectionValid = false;
                            });

                            availabledays.forEach((element) {
                              showavailable.add(element.dayName.toString());
                            });
                            CustomSnackBar.showSnackBar(
                                title:
                                    "Please select from weekdays service provider will be available:",
                                message: showavailable.toString(),
                                backgroundColor: Colors.redAccent);
                            showavailable.clear();
                          }
                          showavailable.clear();
                        },
                      ),
                    ),
                    // Container(
                    //   height: 90,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       demoDate1("${weekday}", "${dateparse.day}", true),
                    //       demoDate2(
                    //           widget.requestModelAdmin!.shop!.availabledays![0]
                    //               .toString(),
                    //           "12",
                    //           false),
                    //       demoDate3("Wed", "13", false),
                    //       demoDate4("Thur", "14", false),
                    //       demoDate5("Fri", "15", false),
                    //       demoDate6("Sat", "16", false),
                    //       demoDate7("Sun", "17", false),
                    //     ],
                    //   ),
                    // ),

                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      endIndent: 10,
                      thickness: 1,
                      color: kAppDividerColor,
                    ),
                    Container(
                      child: Text(
                        'Select time',
                        style: TextStyle(
                          color: Color(0xff363636),
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    Container(
                        height: 70,
                        child: _availableslot.time == ''
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: appointments.length,
                                itemBuilder: (context, index) {
                                  return spTimingsData(
                                      appointments[index], index);
                                })
                            : spTimingsData(_availableslot, 0)),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      thickness: 1,
                      color: kAppDividerColor,
                    ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(0, 420, 20, 0),
                    //   child: GridView.count(
                    //     shrinkWrap: true,
                    //     crossAxisCount: 3,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     childAspectRatio: 2.4,
                    //     children: [
                    //       spTimingsData("08:30 AM", true),
                    //       spTimingsData("08:45 AM", false),
                    //       spTimingsData("09:00 AM", false),
                    //       spTimingsData("09:30 AM", false),
                    //       spTimingsData("09:45 AM", false),
                    //       spTimingsData("10:00 AM", false),
                    //     ],
                    //   ),
                    // ),

                    // Container(
                    //   margin: EdgeInsets.fromLTRB(0, 565, 20, 0),
                    //   child: GridView.count(
                    //     shrinkWrap: true,
                    //     crossAxisCount: 3,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     childAspectRatio: 2.4,
                    //     children: [
                    //       spTimingsData("08:30 AM", true),
                    //       spTimingsData("08:30 AM", false),
                    //       spTimingsData("08:30 AM", false),
                    //       spTimingsData("08:30 AM", false),
                    //       spTimingsData("08:30 AM", false),
                    //       spTimingsData("08:30 AM", false),
                    //     ],
                    //   ),
                    // ),

                    // Positioned(
                    //   left: MediaQuery.of(context).size.width / 10.7,
                    //   top: MediaQuery.of(context).size.height / 1.115,
                    //   child: MaterialButton(
                    //     padding: const EdgeInsets.fromLTRB(120, 8, 120, 8),
                    //     onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => AppointmentCustomerThree())),
                    //     color: const Color(0xff28676E),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: const Text(
                    //       'Next',
                    //       style: TextStyle(color: Colors.white, fontSize: 26),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * .04,
                          top: MediaQuery.of(context).size.height * .08),
                      child: MaterialButton(
                        padding: const EdgeInsets.fromLTRB(120, 5, 120, 5),
                        onPressed: () {
                          if (selectedTime != "" && isSelectionValid == true) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AppointmentCustomerThree(
                                  requestModelAdmin:
                                  widget.requestModelAdmin,
                                  selectedTime: selectedTime,
                                  selectedDate: _selectedValue,
                                  isReschedule: widget.isReschedule,
                                    rescheduleDocId: widget.rescheduleDocId,
                                )));
                          } else {
                            availabledays.forEach((element) {
                              showavailable.add(element.dayName.toString());
                            });
                            CustomSnackBar.showSnackBar(
                                title: "Please select Valid date:",
                                message: showavailable.toString(),
                                backgroundColor: Colors.redAccent);
                            showavailable.clear();
                          }
                        },
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

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 25.0),
                    //   child: MaterialButton(
                    //     padding: const EdgeInsets.fromLTRB(120, 8, 120, 8),
                    //     onPressed: () => Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 AppointmentCustomerThree())),
                    //     color: const Color(0xff28676E),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: const Text(
                    //       'Next',
                    //       style: TextStyle(color: Colors.white, fontSize: 26),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  bool checkavailibility(DateTime date) {
    bool isavailable = false;
    availabledays.forEach((element) {
      if (element.dayName!.toLowerCase() ==
          DateFormat('EEEE').format(date).toLowerCase()) isavailable = true;

      print(DateFormat('EEEE').format(date).toLowerCase());
    });
    return isavailable;
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

  // Widget demoDate1(String day, String date, bool isSelected) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         choise = 0;
  //       });
  //     },
  //     child: Container(
  //       width: 70,
  //       margin: EdgeInsets.only(right: 15),
  //       decoration: BoxDecoration(
  //         color: choise == 0 ? kAppointmentColor : kAppDividerColor,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             child: Text(
  //               day,
  //               style: TextStyle(
  //                 color: choise == 0 ? kWhiteColor : kBlackColor,
  //                 fontSize: 20,
  //                 fontFamily: 'Roboto',
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(top: 10),
  //             padding: EdgeInsets.all(7),
  //             child: Text(
  //               date,
  //               style: TextStyle(
  //                   color: choise == 0 ? kWhiteColor : kBlackColor,
  //                   fontSize: 15,
  //                   fontFamily: 'Roboto',
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget demoDate2(String day, String date, bool isSelected) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         choise = 1;
  //       });
  //     },
  //     child: Container(
  //       width: 70,
  //       margin: EdgeInsets.only(right: 15),
  //       decoration: BoxDecoration(
  //         color: choise == 1 ? kAppointmentColor : kAppDividerColor,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             child: Text(
  //               day,
  //               style: TextStyle(
  //                 color: choise == 1 ? kWhiteColor : kBlackColor,
  //                 fontSize: 20,
  //                 fontFamily: 'Roboto',
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(top: 10),
  //             padding: EdgeInsets.all(7),
  //             child: Text(
  //               date,
  //               style: TextStyle(
  //                   color: choise == 1 ? kWhiteColor : kBlackColor,
  //                   fontSize: 15,
  //                   fontFamily: 'Roboto',
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget demoDate3(String day, String date, bool isSelected) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         choise = 2;
  //       });
  //     },
  //     child: Container(
  //       width: 70,
  //       margin: EdgeInsets.only(right: 15),
  //       decoration: BoxDecoration(
  //         color: choise == 2 ? kAppointmentColor : kAppDividerColor,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             child: Text(
  //               day,
  //               style: TextStyle(
  //                 color: choise == 2 ? kWhiteColor : kBlackColor,
  //                 fontSize: 20,
  //                 fontFamily: 'Roboto',
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(top: 10),
  //             padding: EdgeInsets.all(7),
  //             child: Text(
  //               date,
  //               style: TextStyle(
  //                   color: choise == 2 ? kWhiteColor : kBlackColor,
  //                   fontSize: 15,
  //                   fontFamily: 'Roboto',
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget demoDate4(String day, String date, bool isSelected) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         choise = 3;
  //       });
  //     },
  //     child: Container(
  //       width: 70,
  //       margin: EdgeInsets.only(right: 15),
  //       decoration: BoxDecoration(
  //         color: choise == 3 ? kAppointmentColor : kAppDividerColor,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             child: Text(
  //               day,
  //               style: TextStyle(
  //                 color: choise == 3 ? kWhiteColor : kBlackColor,
  //                 fontSize: 20,
  //                 fontFamily: 'Roboto',
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(top: 10),
  //             padding: EdgeInsets.all(7),
  //             child: Text(
  //               date,
  //               style: TextStyle(
  //                   color: choise == 3 ? kWhiteColor : kBlackColor,
  //                   fontSize: 15,
  //                   fontFamily: 'Roboto',
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget demoDate5(String day, String date, bool isSelected) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         choise = 4;
  //       });
  //     },
  //     child: Container(
  //       width: 70,
  //       margin: EdgeInsets.only(right: 15),
  //       decoration: BoxDecoration(
  //         color: choise == 4 ? kAppointmentColor : kAppDividerColor,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             child: Text(
  //               day,
  //               style: TextStyle(
  //                 color: choise == 4 ? kWhiteColor : kBlackColor,
  //                 fontSize: 20,
  //                 fontFamily: 'Roboto',
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(top: 10),
  //             padding: EdgeInsets.all(7),
  //             child: Text(
  //               date,
  //               style: TextStyle(
  //                   color: choise == 4 ? kWhiteColor : kBlackColor,
  //                   fontSize: 15,
  //                   fontFamily: 'Roboto',
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget demoDate6(String day, String date, bool isSelected) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         choise = 5;
  //       });
  //     },
  //     child: Container(
  //       width: 70,
  //       margin: EdgeInsets.only(right: 15),
  //       decoration: BoxDecoration(
  //         color: choise == 5 ? kAppointmentColor : kAppDividerColor,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             child: Text(
  //               day,
  //               style: TextStyle(
  //                 color: choise == 5 ? kWhiteColor : kBlackColor,
  //                 fontSize: 20,
  //                 fontFamily: 'Roboto',
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(top: 10),
  //             padding: EdgeInsets.all(7),
  //             child: Text(
  //               date,
  //               style: TextStyle(
  //                   color: choise == 5 ? kWhiteColor : kBlackColor,
  //                   fontSize: 15,
  //                   fontFamily: 'Roboto',
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget demoDate7(String day, String date, bool isSelected) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         choise = 6;
  //       });
  //     },
  //     child: Container(
  //       width: 70,
  //       margin: EdgeInsets.only(right: 15),
  //       decoration: BoxDecoration(
  //         color: choise == 6 ? kAppointmentColor : kAppDividerColor,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //             child: Text(
  //               day,
  //               style: TextStyle(
  //                 color: choise == 6 ? kWhiteColor : kBlackColor,
  //                 fontSize: 20,
  //                 fontFamily: 'Roboto',
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             margin: EdgeInsets.only(top: 10),
  //             padding: EdgeInsets.all(7),
  //             child: Text(
  //               date,
  //               style: TextStyle(
  //                   color: choise == 6 ? kWhiteColor : kBlackColor,
  //                   fontSize: 15,
  //                   fontFamily: 'Roboto',
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget spTimingsData(Appointments selectetAppointments, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          appointments.forEach((element) {
            element.isSelected = false;
          });
          selectedTime = selectetAppointments.time;
          appointments[index].isSelected = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(right: 2, left: 2),
          decoration: BoxDecoration(
            color: appointments[index].isSelected
                ? kAppointmentColor
                : Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 2),
                child: Icon(
                  Icons.access_time,
                  color: appointments[index].isSelected
                      ? Colors.white
                      : Colors.black,
                  size: 18,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Text(
                  selectetAppointments.time,
                  style: TextStyle(
                    color: appointments[index].isSelected
                        ? Colors.white
                        : Colors.black,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // :

    //  Container(
    //     margin: EdgeInsets.only(left: 20, top: 5),
    //     decoration: BoxDecoration(
    //       color: Color(0xffEEEEEE),
    //       borderRadius: BorderRadius.circular(5),
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Container(
    //           margin: EdgeInsets.only(right: 2),
    //           child: Icon(
    //             Icons.access_time,
    //             color: Colors.black,
    //             size: 18,
    //           ),
    //         ),
    //         Container(
    //           margin: EdgeInsets.only(left: 2),
    //           child: Text(
    //             time,
    //             style: TextStyle(
    //               color: Colors.black,
    //               fontSize: 16,
    //               fontFamily: 'Roboto',
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
  }

  Future<void> _selectDate(BuildContext context) async {
    var selectedDate;
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        selectableDayPredicate: _predicate,
        firstDate: DateTime(2019),
        lastDate: DateTime(2021),
        builder: (context, child) {
          return Theme(
            data: ThemeData(
                primaryColor: Colors.orangeAccent,
                disabledColor: Colors.brown,
                textTheme:
                    TextTheme(bodyText1: TextStyle(color: Colors.blueAccent)),
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: Colors.yellow)),
            child: Text('fdf'),
          );
        });
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  bool _predicate(DateTime day) {
    if ((day.isAfter(DateTime(2020, 1, 5)) &&
        day.isBefore(DateTime(2020, 1, 9)))) {
      return true;
    }

    if ((day.isAfter(DateTime(2020, 1, 10)) &&
        day.isBefore(DateTime(2020, 1, 15)))) {
      return true;
    }
    if ((day.isAfter(DateTime(2020, 2, 5)) &&
        day.isBefore(DateTime(2020, 2, 17)))) {
      return true;
    }

    return false;
  }

  void getdatetime() {
    appointments.clear();
    availabledays.clear();

    DateTime now = DateTime.now();
    var date = now.toString();
    widget.requestModelAdmin!.shop!.availabledays!.forEach((element) {
      availabledays.add(element);
      appointments.add(Appointments(
          time: '${element.fromTime}-${element.toTIme}', isSelected: false));
    });

    dateparse = DateTime.parse(date);
    weekday = DateFormat('EEEE').format(now);
  }
}

class Appointments {
  String time;
  bool isSelected;

  Appointments({
    required this.time,
    required this.isSelected,
  });
}
