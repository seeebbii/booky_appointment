import 'package:booky/theme.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_time_range/flutter_time_range.dart';

class testSp extends StatefulWidget {
  static String id = "testSp";

  @override
  _testSp createState() => _testSp();
}

class _testSp extends State<testSp> {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  final _navigatorKey = GlobalKey<NavigatorState>();
  bool textHuors = false;
  // TimeOfDay froom = TimeOfDay(hour: 10, minute: 30);
  // TimeOfDay too = TimeOfDay(hour: 7, minute: 30);
String msg = "Choose";
// String msg2 = "0";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: _navigatorKey,
        scaffoldMessengerKey: _messangerKey,
        home: Scaffold(
            body: Center(
          child: Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              Text(msg),
              SizedBox(height: 40,),
              SizedBox(height: 40,),
              TextButton(
                child: Text(
                  "Opining Hours",
                  style: TextStyle(color: kBlackColor),
                ),
                onPressed: () {
                  ChoosingHoursAlertTest(
                      _navigatorKey.currentState!.overlay!.context, "Thursday");
                },
              ),
            ],
          ),
        )));
  }
  ChoosingHoursAlertTest(context, String day) {
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
                        //String start = f.hoursPerDay.toString() + ":" + from.minutesPerHour.toString;
                        setState(() {
                          msg = "From : $f, To : $t";
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
}








  
//   TimeOfDay _startTime = TimeOfDay(hour: 10, minute: 00);
//   TimeOfDay _endTime = TimeOfDay(hour: 7, minute: 30);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       body: Stack(
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left:50.0, top: 100),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Opining Hours",
//                       textAlign: TextAlign.start,
//                     ),
//                     ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(kWhiteColor),
//                       ),
//                       child: Text(
//                         "${_timeFormated(_startTime)} - " +
//                             "${_timeFormated(_endTime)}",
//                         style: TextStyle(color: kBlackColor),
//                       ),
//                       // Text("OpenPicker"),
//                       onPressed: () => TimeRangePicker.show(
//                         timeRangeViewType: ,
//                         context: context,
//                         unSelectedEmpty: true,
//                         startTime: TimeOfDay(
//                             hour: _startTime.hour, minute: _startTime.minute),
//                         endTime:
//                             TimeOfDay(
//                             hour: _endTime.hour, minute: _endTime.minute),
//                         onSubmitted: (TimeRangeValue value) {
//                           setState(() {
//                             _startTime = value.startTime!;
//                             _endTime = value.endTime!;
//                           });
//                         },
//                       ),
//                     ),
//                     // Text(
//                     //     "${_timeFormated(_startTime)} - " +
//                     //         "${_timeFormated(_endTime)}",
//                     //     style: TextStyle(color: kBlackColor),
//                     //   ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   String _timeFormated(TimeOfDay time) {
//     if (time == null) return "--:--";
//     return "${time.hour}:${time.minute}";
//   }
// }
