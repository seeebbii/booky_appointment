import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/controller/service_provider/service_provider_controller.dart';
import 'package:booky/model/provider_business_model.dart';

import 'package:booky/screens/alerts.dart';
import 'package:booky/screens/customer/home_customer.dart';
import 'package:booky/screens/service_provider/conformation_sp.dart';
import 'package:booky/screens/service_provider/location_sp.dart';
import 'package:booky/screens/service_provider/sign_up_sp.dart';
import 'package:booky/theme.dart';
import 'package:booky/utils/auth_exception_handler.dart';
import 'package:booky/utils/colors.dart';
import 'package:booky/utils/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_range/flutter_time_range.dart';
import 'package:get/get.dart';

class BusinessHoursOne extends StatefulWidget {
  static String id = "BusinessHoursOne";
  const BusinessHoursOne({Key? key}) : super(key: key);

  @override
  _BusinessHoursOne createState() => _BusinessHoursOne();
}

class _BusinessHoursOne extends State<BusinessHoursOne> {
  Availableday? availableday;

  final spController = Get.put(ServiceProvider());
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

  // Future<bool> createAppoitmentInDatabase(Schedule schedule) async {
  //   try {
  //     Timestamp currentTime = Timestamp.now();
  //     DocumentReference document = _firestore.collection('available-appointments').doc();
  //     await document.set({
  //       "nurseId": authController.currentUser.value.uid,
  //       "schedule": schedule.toJson(),
  //       "createdAt": Timestamp.now(),
  //       "docId" : document.id
  //     });
  //     createAppointmentInNurseCollection(schedule, currentTime, document);
  //     CustomSnackBar.showSnackBar(
  //         title: "Appoitment successfully created",
  //         message: '',
  //         backgroundColor: snackBarSuccess);
  //     return true;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return false;
  //   }
  // }

  bool isSwitched = false;
  bool isSwitchedTwo = false;
  bool isSwitchedThree = false;
  bool isSwitchedFour = false;
  bool isSwitchedFive = false;
  bool isSwitchedSix = false;
  bool isSwitchedSeven = false;
  String msg = "Select";
  String msg2 = "Select";
  String msg3 = "Select";
  String msg4 = "Select";
  String msg5 = "Select";
  String msg6 = "Select";
  String msg7 = "Select";

  velidateAndSubmit() async {
    spController.businessModel = new ProviderBusinessModel(
        businessCategory: spController.categoryChoice.values
            .elementAt(spController.choise.value),
        businesscreateddate: Timestamp.fromDate(DateTime.now()),
        availabledays: spController.availabledays,
        dummytemp: 'text for future use',
        shoplocation: spController.locationController.text,
        status: 'Requested');

    final status = await authController.createUser(
        spController.signupEmailController.text,
        spController.signupPasswordController.text,
        spController.signupNameController.text,
        spController.signupPhoneController.text,
        "serviceProvider",
        spController.signupBusinessNameController.text,
        0);

    if (status == AuthResultStatus.successful) {
      if (await spController.createBusnessShopInDatabase()) {
        print("SHOP CREATE");

        Get.offAll(ConformationSpScreen());
      } else {
        print("SHOP CREATEING FAILED");
        final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
        CustomSnackBar.showSnackBar(
            title: errorMsg, message: '', backgroundColor: snackBarError);
      }
      // CustomSnackBar.showSnackBar(
      //     title: "Account created Successfully",
      //     message: '',
      //     backgroundColor: snackBarSuccess);
    } else {
      final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
      CustomSnackBar.showSnackBar(
          title: errorMsg, message: '', backgroundColor: snackBarError);
    }
  }

  ChoosingHours(context, String day) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  day,
                  style: TextStyle(fontSize: 24),
                ),
                content: TimeRangePicker(
                  initialFromHour: 10,
                  initialFromMinutes: 30,
                  initialToHour: 19,
                  initialToMinutes: 30,
                  backText: "Back",
                  nextText: "Next",
                  cancelText: "Cancel",
                  selectText: "Save",
                  selectedTimeStyle:
                      const TextStyle(color: kBlackColor, fontSize: 30),
                  activeTabStyle:
                      const TextStyle(color: kAppDividerColor, fontSize: 14),
                  editable: true,
                  is24Format: false,
                  disableTabInteraction: true,
                  activeBgColor: kSecondaryColor,
                  inactiveBgColor: Colors.grey,
                  activeLabelColor: kSecondaryColor,
                  indicatorColor: kSecondaryColor,
                  timeContainerStyle: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(7)),
                  separatorStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 100),
                  onSelect: (from, to) {
                    String f = from.format(context).toString();
                    String t = to.format(context).toString();
                    setState(() {
                      msg = "$f - $t";
                      spController.availabledays.add(
                          Availableday(dayName: day, fromTime: f, toTIme: t));
                    });
                    Navigator.pop(context);
                  },
                  onCancel: () => Navigator.pop(context),
                ),
              ),
            ],
          );
        });
  }

  ChoosingHours2(context, String day) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  day,
                  style: TextStyle(fontSize: 24),
                ),
                content: TimeRangePicker(
                  initialFromHour: 10,
                  initialFromMinutes: 30,
                  initialToHour: 19,
                  initialToMinutes: 30,
                  backText: "Back",
                  nextText: "Next",
                  cancelText: "Cancel",
                  selectText: "Save",
                  selectedTimeStyle:
                      const TextStyle(color: kBlackColor, fontSize: 30),
                  activeTabStyle:
                      const TextStyle(color: kAppDividerColor, fontSize: 14),
                  editable: true,
                  is24Format: false,
                  disableTabInteraction: true,
                  activeBgColor: kSecondaryColor,
                  inactiveBgColor: Colors.grey,
                  activeLabelColor: kSecondaryColor,
                  indicatorColor: kSecondaryColor,
                  timeContainerStyle: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(7)),
                  separatorStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 100),
                  onSelect: (from, to) {
                    String f = from.format(context).toString();
                    String t = to.format(context).toString();
                    setState(() {
                      msg2 = "$f - $t";
                      spController.availabledays.add(
                          Availableday(dayName: day, fromTime: f, toTIme: t));
                    });
                    Navigator.pop(context);
                  },
                  onCancel: () => Navigator.pop(context),
                ),
              ),
            ],
          );
        });
  }

  ChoosingHours3(context, String day) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  day,
                  style: TextStyle(fontSize: 24),
                ),
                content: TimeRangePicker(
                  initialFromHour: 10,
                  initialFromMinutes: 30,
                  initialToHour: 19,
                  initialToMinutes: 30,
                  backText: "Back",
                  nextText: "Next",
                  cancelText: "Cancel",
                  selectText: "Save",
                  selectedTimeStyle:
                      const TextStyle(color: kBlackColor, fontSize: 30),
                  activeTabStyle:
                      const TextStyle(color: kAppDividerColor, fontSize: 14),
                  editable: true,
                  is24Format: false,
                  disableTabInteraction: true,
                  activeBgColor: kSecondaryColor,
                  inactiveBgColor: Colors.grey,
                  activeLabelColor: kSecondaryColor,
                  indicatorColor: kSecondaryColor,
                  timeContainerStyle: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(7)),
                  separatorStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 100),
                  onSelect: (from, to) {
                    String f = from.format(context).toString();
                    String t = to.format(context).toString();
                    setState(() {
                      msg3 = "$f - $t";
                      spController.availabledays.add(
                          Availableday(dayName: day, fromTime: f, toTIme: t));
                    });
                    Navigator.pop(context);
                  },
                  onCancel: () => Navigator.pop(context),
                ),
              ),
            ],
          );
        });
  }

  ChoosingHours4(context, String day) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  day,
                  style: TextStyle(fontSize: 24),
                ),
                content: TimeRangePicker(
                  initialFromHour: 10,
                  initialFromMinutes: 30,
                  initialToHour: 19,
                  initialToMinutes: 30,
                  backText: "Back",
                  nextText: "Next",
                  cancelText: "Cancel",
                  selectText: "Save",
                  selectedTimeStyle:
                      const TextStyle(color: kBlackColor, fontSize: 30),
                  activeTabStyle:
                      const TextStyle(color: kAppDividerColor, fontSize: 14),
                  editable: true,
                  is24Format: false,
                  disableTabInteraction: true,
                  activeBgColor: kSecondaryColor,
                  inactiveBgColor: Colors.grey,
                  activeLabelColor: kSecondaryColor,
                  indicatorColor: kSecondaryColor,
                  timeContainerStyle: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(7)),
                  separatorStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 100),
                  onSelect: (from, to) {
                    String f = from.format(context).toString();
                    String t = to.format(context).toString();
                    setState(() {
                      msg4 = "$f - $t";
                      spController.availabledays.add(
                          Availableday(dayName: day, fromTime: f, toTIme: t));
                    });
                    Navigator.pop(context);
                  },
                  onCancel: () => Navigator.pop(context),
                ),
              ),
            ],
          );
        });
  }

  ChoosingHours5(context, String day) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  day,
                  style: TextStyle(fontSize: 24),
                ),
                content: TimeRangePicker(
                  initialFromHour: 10,
                  initialFromMinutes: 30,
                  initialToHour: 19,
                  initialToMinutes: 30,
                  backText: "Back",
                  nextText: "Next",
                  cancelText: "Cancel",
                  selectText: "Save",
                  selectedTimeStyle:
                      const TextStyle(color: kBlackColor, fontSize: 30),
                  activeTabStyle:
                      const TextStyle(color: kAppDividerColor, fontSize: 14),
                  editable: true,
                  is24Format: false,
                  disableTabInteraction: true,
                  activeBgColor: kSecondaryColor,
                  inactiveBgColor: Colors.grey,
                  activeLabelColor: kSecondaryColor,
                  indicatorColor: kSecondaryColor,
                  timeContainerStyle: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(7)),
                  separatorStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 100),
                  onSelect: (from, to) {
                    String f = from.format(context).toString();
                    String t = to.format(context).toString();
                    setState(() {
                      msg5 = "$f - $t";
                      spController.availabledays.add(
                          Availableday(dayName: day, fromTime: f, toTIme: t));
                    });
                    Navigator.pop(context);
                  },
                  onCancel: () => Navigator.pop(context),
                ),
              ),
            ],
          );
        });
  }

  ChoosingHours6(context, String day) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  day,
                  style: TextStyle(fontSize: 24),
                ),
                content: TimeRangePicker(
                  initialFromHour: 10,
                  initialFromMinutes: 30,
                  initialToHour: 19,
                  initialToMinutes: 30,
                  backText: "Back",
                  nextText: "Next",
                  cancelText: "Cancel",
                  selectText: "Save",
                  selectedTimeStyle:
                      const TextStyle(color: kBlackColor, fontSize: 30),
                  activeTabStyle:
                      const TextStyle(color: kAppDividerColor, fontSize: 14),
                  editable: true,
                  is24Format: false,
                  disableTabInteraction: true,
                  activeBgColor: kSecondaryColor,
                  inactiveBgColor: Colors.grey,
                  activeLabelColor: kSecondaryColor,
                  indicatorColor: kSecondaryColor,
                  timeContainerStyle: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(7)),
                  separatorStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 100),
                  onSelect: (from, to) {
                    String f = from.format(context).toString();
                    String t = to.format(context).toString();
                    setState(() {
                      msg6 = "$f - $t";
                      spController.availabledays.add(
                          Availableday(dayName: day, fromTime: f, toTIme: t));
                    });
                    Navigator.pop(context);
                  },
                  onCancel: () => Navigator.pop(context),
                ),
              ),
            ],
          );
        });
  }

  ChoosingHours7(context, String day) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  day,
                  style: TextStyle(fontSize: 24),
                ),
                content: TimeRangePicker(
                  initialFromHour: 10,
                  initialFromMinutes: 30,
                  initialToHour: 19,
                  initialToMinutes: 30,
                  backText: "Back",
                  nextText: "Next",
                  cancelText: "Cancel",
                  selectText: "Save",
                  selectedTimeStyle:
                      const TextStyle(color: kBlackColor, fontSize: 30),
                  activeTabStyle:
                      const TextStyle(color: kAppDividerColor, fontSize: 14),
                  editable: true,
                  is24Format: false,
                  disableTabInteraction: true,
                  activeBgColor: kSecondaryColor,
                  inactiveBgColor: Colors.grey,
                  activeLabelColor: kSecondaryColor,
                  indicatorColor: kSecondaryColor,
                  timeContainerStyle: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(7)),
                  separatorStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 100),
                  onSelect: (from, to) {
                    String f = from.format(context).toString();
                    String t = to.format(context).toString();
                    setState(() {
                      msg7 = "$f - $t";
                      spController.availabledays.add(
                          Availableday(dayName: day, fromTime: f, toTIme: t));
                    });
                    Navigator.pop(context);
                  },
                  onCancel: () => Navigator.pop(context),
                ),
              ),
            ],
          );
        });
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitchTwo(bool value) {
    if (isSwitchedTwo == false) {
      setState(() {
        isSwitchedTwo = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedTwo = false;
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitchThree(bool value) {
    if (isSwitchedThree == false) {
      setState(() {
        isSwitchedThree = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedThree = false;
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitchFour(bool value) {
    if (isSwitchedFour == false) {
      setState(() {
        isSwitchedFour = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedFour = false;
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitchFive(bool value) {
    if (isSwitchedFive == false) {
      setState(() {
        isSwitchedFive = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedFive = false;
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitchSix(bool value) {
    if (isSwitchedSix == false) {
      setState(() {
        isSwitchedSix = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedSix = false;
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitchSeven(bool value) {
    if (isSwitchedSeven == false) {
      setState(() {
        isSwitchedSeven = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchedSeven = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Business Hours",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 28.0,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            (isSwitched)
                                ? ChoosingHours(context, "Sunday")
                                : failedAlert(context);
                          },
                          child: Row(
                            children: [
                              Transform.scale(
                                  scale: 1.2,
                                  child: Switch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched,
                                    activeColor: Colors.white,
                                    activeTrackColor: kToggleButton,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey.shade400,
                                  )),
                              Text(
                                'Sunday',
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.245),
                                child: Container(
                                  width: 80,
                                  child: Text(
                                    msg,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 1),
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 30,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      (isSwitchedTwo)
                          ? ChoosingHours2(context, "Monday")
                          : failedAlert(context);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Transform.scale(
                                  scale: 1.2,
                                  child: Switch(
                                    onChanged: toggleSwitchTwo,
                                    value: isSwitchedTwo,
                                    activeColor: Colors.white,
                                    activeTrackColor: kToggleButton,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey.shade400,
                                  )),
                              Text(
                                'Monday',
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.23),
                                child: Container(
                                  width: 80,
                                  child: Text(
                                    msg2,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      (isSwitchedThree)
                          ? ChoosingHours3(context, "Tuseday")
                          : failedAlert(context);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Transform.scale(
                                  scale: 1.2,
                                  child: Switch(
                                    onChanged: toggleSwitchThree,
                                    value: isSwitchedThree,
                                    activeColor: Colors.white,
                                    activeTrackColor: kToggleButton,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey.shade400,
                                  )),
                              Text(
                                'Tuesday',
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.23),
                                child: Container(
                                  width: 80,
                                  child: Text(
                                    msg3,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      (isSwitchedFour)
                          ? ChoosingHours4(context, "Wednesday")
                          : failedAlert(context);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Transform.scale(
                                  scale: 1.2,
                                  child: Switch(
                                    onChanged: toggleSwitchFour,
                                    value: isSwitchedFour,
                                    activeColor: Colors.white,
                                    activeTrackColor: kToggleButton,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey.shade400,
                                  )),
                              Text(
                                'Wednesday',
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.155),
                                child: Container(
                                  width: 80,
                                  child: Text(
                                    msg4,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      (isSwitchedFive)
                          ? ChoosingHours5(context, "Thursday")
                          : failedAlert(context);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Transform.scale(
                                  scale: 1.2,
                                  child: Switch(
                                    onChanged: toggleSwitchFive,
                                    value: isSwitchedFive,
                                    activeColor: Colors.white,
                                    activeTrackColor: kToggleButton,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey.shade400,
                                  )),
                              Text(
                                'Thursday',
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.21),
                                child: Container(
                                  width: 80,
                                  child: Text(
                                    msg5,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 1),
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      (isSwitchedSix)
                          ? ChoosingHours6(context, "Friday")
                          : failedAlert(context);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Transform.scale(
                                  scale: 1.2,
                                  child: Switch(
                                    onChanged: toggleSwitchSix,
                                    value: isSwitchedSix,
                                    activeColor: Colors.white,
                                    activeTrackColor: kToggleButton,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey.shade400,
                                  )),
                              Text(
                                'Friday',
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.29),
                                child: Container(
                                  width: 80,
                                  child: Text(
                                    msg6,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 1),
                                child: Row(
                                  children: [
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      (isSwitchedSeven)
                          ? ChoosingHours7(context, "Saturday")
                          : failedAlert(context);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Transform.scale(
                                  scale: 1.2,
                                  child: Switch(
                                    onChanged: toggleSwitchSeven,
                                    value: isSwitchedSeven,
                                    activeColor: Colors.white,
                                    activeTrackColor: kToggleButton,
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey.shade400,
                                  )),
                              Text(
                                'Saturday',
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.23),
                                child: Container(
                                  width: 80,
                                  child: Text(
                                    msg7,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 1),
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color(0xff6A6A6A),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              child: Text(
                                'Back',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  // fontFamily: 'WorkSansBold'
                                ),
                              ),
                            ),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => LocationSp())),
                          ),
                        ),
                        Container(
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: kPrimaryColor,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 40.0),
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    // fontFamily: 'WorkSansBold'
                                  ),
                                ),
                              ),
                              onPressed: () {
                                velidateAndSubmit();

                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) =>
                                //         ConformationSpScreen()));
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
