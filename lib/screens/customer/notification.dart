import 'package:booky/constant.dart';
import 'package:flutter/material.dart';
import 'package:booky/theme.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationCustomer extends StatelessWidget {
  static const String id = "NotificationCustomer";
  final title = 'Notification';

  void _showDialog(String mesg, BuildContext cxt, Function func) {
    // flutter defined function
    showDialog(
        context: cxt,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: kAppointmentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 195,
              width: 310,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Center(
                      child: Image(
                        image: AssetImage(
                          "assets/error.png",
                        ),
                        width: 36,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "اوقات العمل",
                        style: TextStyle(
                          color: kAppDividerColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 20,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: "من الاحد الى الخميس",
                          style: TextStyle(
                            color: kAppointmentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "8:00" + "AM" + "-" + "2:00" + "PM",
                          style: TextStyle(
                            color: kAppDividerColor,
                            fontSize: 18,
                            //fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      title: title,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 25.0, // soften the shadow
                spreadRadius: 2.0, //extend the shadow
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "This is a new Notification!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                    "kswledcmkwedmedmw  dwidjfiejeioqnf de2hn23idnh32 dihediwen dwenq dwednikw ")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Listitem extends StatelessWidget {
  void showQASheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.40,
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
                    mainAxisAlignment: MainAxisAlignment.end,
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 25.0, // soften the shadow
                          spreadRadius: 2.0, //extend the shadow
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Text(
                        "questionAnswer",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontFamily: "Cairo",
                        ),
                      ),
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
      subtitle: Text("Check our discont 80%!"),
    );
  }
}

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
