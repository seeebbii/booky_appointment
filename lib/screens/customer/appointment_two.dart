import 'package:booky/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'appointment_three.dart';

class AppointmentCustomerTwo extends StatefulWidget {
  static String id = "AppointmentCustomerTwo";
  const AppointmentCustomerTwo({Key? key}) : super(key: key);

  @override
  _AppointmentCustomerTwoState createState() => _AppointmentCustomerTwoState();

}

class _AppointmentCustomerTwoState extends State<AppointmentCustomerTwo> {
  List months=[
    'Jan','Feb','March','April','May','June','July','August','Sepetember','October','Nov','December'
  ];
 var dateparse;
 late String weekday;
void initState() {
  getdatetime();
  
}
  int choise = 0;
  @override
  Widget build(BuildContext context) {
    getdatetime();
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
                    Text(
                      'Select Day',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: kPrimaryTextColor),
                    ),
                    Text(
                     "${months[dateparse.month-1]},${dateparse.year}",
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Container(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          demoDate1("${weekday}", "${dateparse.day}", true),
                          demoDate2("Tue", "12", false),
                          demoDate3("Wed", "13", false),
                          demoDate4("Thur", "14", false),
                          demoDate5("Fri", "15", false),
                          demoDate6("Sat", "16", false),
                          demoDate7("Sun", "17", false),
                        ],
                      ),
                    ),
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
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          spTimingsData("08:30 AM", true),
                          spTimingsData("08:45 AM", false),
                          spTimingsData("09:00 AM", false),
                          spTimingsData("09:30 AM", false),
                          spTimingsData("09:45 AM", false),
                          spTimingsData("10:00 AM", false),
                        ],
                      ),
                    ),
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
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    AppointmentCustomerThree())),
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

  Widget demoDate1(String day, String date, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          choise = 0;
        });
      },
      child: Container(
        width: 70,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: choise == 0 ? kAppointmentColor : kAppDividerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                day,
                style: TextStyle(
                  color: choise == 0 ? kWhiteColor : kBlackColor,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(7),
              child: Text(
                date,
                style: TextStyle(
                    color: choise == 0 ? kWhiteColor : kBlackColor,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoDate2(String day, String date, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          choise = 1;
        });
      },
      child: Container(
        width: 70,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: choise == 1 ? kAppointmentColor : kAppDividerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                day,
                style: TextStyle(
                  color: choise == 1 ? kWhiteColor : kBlackColor,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(7),
              child: Text(
                date,
                style: TextStyle(
                    color: choise == 1 ? kWhiteColor : kBlackColor,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoDate3(String day, String date, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          choise = 2;
        });
      },
      child: Container(
        width: 70,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: choise == 2 ? kAppointmentColor : kAppDividerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                day,
                style: TextStyle(
                  color: choise == 2 ? kWhiteColor : kBlackColor,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(7),
              child: Text(
                date,
                style: TextStyle(
                    color: choise == 2 ? kWhiteColor : kBlackColor,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoDate4(String day, String date, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          choise = 3;
        });
      },
      child: Container(
        width: 70,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: choise == 3 ? kAppointmentColor : kAppDividerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                day,
                style: TextStyle(
                  color: choise == 3 ? kWhiteColor : kBlackColor,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(7),
              child: Text(
                date,
                style: TextStyle(
                    color: choise == 3 ? kWhiteColor : kBlackColor,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoDate5(String day, String date, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          choise = 4;
        });
      },
      child: Container(
        width: 70,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: choise == 4 ? kAppointmentColor : kAppDividerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                day,
                style: TextStyle(
                  color: choise == 4 ? kWhiteColor : kBlackColor,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(7),
              child: Text(
                date,
                style: TextStyle(
                    color: choise == 4 ? kWhiteColor : kBlackColor,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoDate6(String day, String date, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          choise = 5;
        });
      },
      child: Container(
        width: 70,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: choise == 5 ? kAppointmentColor : kAppDividerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                day,
                style: TextStyle(
                  color: choise == 5 ? kWhiteColor : kBlackColor,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(7),
              child: Text(
                date,
                style: TextStyle(
                    color: choise == 5 ? kWhiteColor : kBlackColor,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget demoDate7(String day, String date, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          choise = 6;
        });
      },
      child: Container(
        width: 70,
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: choise == 6 ? kAppointmentColor : kAppDividerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                day,
                style: TextStyle(
                  color: choise == 6 ? kWhiteColor : kBlackColor,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(7),
              child: Text(
                date,
                style: TextStyle(
                    color: choise == 6 ? kWhiteColor : kBlackColor,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget spTimingsData(String time, bool isSelected) {
    return isSelected
        ? Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: kAppointmentColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text(
                    '08:30 AM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(left: 20, top: 5),
            decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  void getdatetime() {
    DateTime now=DateTime.now();
  var date = now.toString();
 
     dateparse = DateTime.parse(date);
 weekday= DateFormat('EEEE').format(now);
  
  }
}
