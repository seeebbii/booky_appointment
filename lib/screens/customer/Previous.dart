import 'package:booky/constant.dart';
import 'package:flutter/material.dart';
import 'package:booky/theme.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviousAppointments extends StatelessWidget {
  static const String id = "PreviousAppointments";
  final title = 'Notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.separated(
                      padding: EdgeInsets.only(top: 20),
                      itemBuilder: (ctx, index) => FAQListitem(),
                      separatorBuilder: (ctx, index) => Divider(
                        thickness: 1,
                      ),
                      itemCount: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FAQListitem extends StatelessWidget {
  void showQASheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.50,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            //  borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: CircleAvatar(
                          child: Icon(
                            Icons.close,
                            color: Colors.red[900],
                          ),
                          backgroundColor: Colors.red[100],
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Appointment Details",
                        style: TextStyle(
                            fontSize: 24,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
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
                      Row(
                        //    mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Monday, 8 Nov 2021",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                // fontFamily: "Raleway"
                              )),
                          SizedBox(
                            width: 50,
                          ),
                          Text("10:45 pm",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                // fontFamily: "Raleway"
                              )),
                        ],
                      ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pic_one.jpg"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
      title: Text("Abdullah car wash"),
      subtitle: InkWell(
          onTap: () {
            showQASheet(context);
          },
          child: Text("Press for details")),
    );
  }
}

// ListTile(
//                     leading: SizedBox(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.5,
//                         width: MediaQuery.of(context).size.width * 0.35,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage(
//                                   "assets/images/logoWithoutName.png"),
//                               fit: BoxFit.fill),
//                           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                         ),
//                       ),
//                     ),
//                     title: Text("Booky"),
//                     subtitle: Text("Welcome to booky"),
//                   ),
//                   ListTile(
//                     leading: SizedBox(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.5,
//                         width: MediaQuery.of(context).size.width * 0.35,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage("assets/images/pic_one.jpg"),
//                               fit: BoxFit.cover),
//                           borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                         ),
//                       ),
//                     ),
//                     title: Text("Abdullah car wash"),
//                     subtitle: Text("Check our discont 80%!"),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   ListTile(
//                     leading: SizedBox(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.5,
//                         width: MediaQuery.of(context).size.width * 0.35,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage("assets/images/pic_one.jpg"),
//                               fit: BoxFit.cover),
//                           borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                         ),
//                       ),
//                     ),
//                     title: Text("Abdullah car wash"),
//                     subtitle: Text("Check our discont 80%!"),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),

class MainContainer extends StatelessWidget {
  MainContainer({required this.title, required this.child});

  String title;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0915),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: Color(0xFFF6F6F6),
                      color: Color(0xFFFEFEFE),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
