import 'package:booky/controller/shops/shop_service.dart';
import 'package:booky/controller/user/admin_controller.dart';
import 'package:booky/model/request_model_admin.dart';
import 'package:booky/screens/customer/appointmet_one.dart';
import 'package:booky/screens/customer/card.dart';
import 'package:flutter/material.dart';
import 'package:booky/theme.dart' as color;
import 'package:get/get.dart';

class UserHome extends StatefulWidget {
  static String id = "UserHome";
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHome createState() => _UserHome();
}

class _UserHome extends State<UserHome> {
  UserController userController = Get.put(UserController());
  int choise = 0;
  bool Boolean = true;
  @override
  void initState() {
    userController.getShops();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: Container(
            height: 90,
            // elevation: 0,
            color: color.kPrimaryColor,
            // shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "B  O  O  K  Y",
                    style: TextStyle(color: color.kWhiteColor, fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFFffffff),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: color.kPrimaryColor,
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.name,
                        cursorColor: Color(0xFFA1A1A1),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: 10, right: 10),
                          hintText: "What service are you looking for?",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff8E8E8E),
                          ),
                          hintStyle: TextStyle(
                            color: Color(0xff8E8E8E),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff8E8E93), width: 0.3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Boolean
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      List<RequestModelAdmin> carwashlist = [];
                                      userController.requests
                                          .forEach((element) {
                                        if (element.shop!.businessCategory
                                                .toString()
                                                .toLowerCase() ==
                                            'car wash')
                                          carwashlist.add(element);
                                      });
                                      setState(() {
                                        choise = 0;
                                        print(choise);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CardScreen(
                                                      categorylist: carwashlist,
                                                    )));
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Stack(children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.162439146800501882,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff28676E),
                                              border: Border.all(
                                                  color: choise == 0
                                                      ? Colors.white
                                                      : Color(0xff28676E),
                                                  width: 1.5),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25.0, top: 25),
                                            child: Image.asset(
                                              "assets/images/car.png",
                                              height: 80,
                                              width: 70,
                                            ),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Car wash",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            // fontFamily: "Raleway"
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      List<RequestModelAdmin> womensSalons = [];
                                      userController.requests
                                          .forEach((element) {
                                        if (element.shop!.businessCategory
                                                .toString()
                                                .toLowerCase() ==
                                            "women's salons")
                                          womensSalons.add(element);
                                      });
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => CardScreen(
                                                    categorylist: womensSalons,
                                                  )));
                                      setState(() {
                                        choise = 1;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Stack(children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.162439146800501882,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff28676E),
                                              border: Border.all(
                                                  color: choise == 1
                                                      ? Colors.white
                                                      : Color(0xff28676E),
                                                  width: 1.5),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25.0, top: 25),
                                            child: Image.asset(
                                              "assets/images/m892.png",
                                              height: 80,
                                              width: 70,
                                            ),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Women's Salons",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            // fontFamily: "Raleway"
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      List<RequestModelAdmin> barbershoplist =
                                          [];
                                      userController.requests
                                          .forEach((element) {
                                        if (element.shop!.businessCategory
                                                .toString()
                                                .toLowerCase() ==
                                            'barber shop')
                                          barbershoplist.add(element);
                                      });
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => CardScreen(
                                                  categorylist:
                                                      barbershoplist)));
                                      setState(() {
                                        choise = 2;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Stack(children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.162439146800501882,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff28676E),
                                              border: Border.all(
                                                  color: choise == 2
                                                      ? Colors.white
                                                      : Color(0xff28676E),
                                                  width: 1.5),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25.0, top: 25),
                                            child: Image.asset(
                                              "assets/images/m89.png",
                                              height: 80,
                                              width: 70,
                                            ),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Barber shop",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            // fontFamily: "Raleway"
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),

                                  InkWell(
                                    onTap: () {
                                      List<RequestModelAdmin> trainerlist = [];
                                      userController.requests
                                          .forEach((element) {
                                        if (element.shop!.businessCategory
                                                .toString()
                                                .toLowerCase() ==
                                            'trainer') trainerlist.add(element);
                                      });
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => CardScreen(
                                                    categorylist: trainerlist,
                                                  )));
                                      setState(() {
                                        choise = 3;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Stack(children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.162439146800501882,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff28676E),
                                              border: Border.all(
                                                  color: choise == 3
                                                      ? Colors.white
                                                      : Color(0xff28676E),
                                                  width: 1.5),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25.0, top: 25),
                                            child: Image.asset(
                                              "assets/images/weightlifter.png",
                                              height: 80,
                                              width: 70,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Trainer",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            // fontFamily: "Raleway"
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),

                                  InkWell(
                                    onTap: () {
                                      List<RequestModelAdmin> otherlist = [];
                                      userController.requests
                                          .forEach((element) {
                                        if (element.shop!.businessCategory
                                                .toString()
                                                .toLowerCase() ==
                                            'other') otherlist.add(element);
                                      });
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => CardScreen(
                                                    categorylist: otherlist,
                                                  )));
                                      setState(() {
                                        choise = 4;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Stack(children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.162439146800501882,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff28676E),
                                              border: Border.all(
                                                  color: choise == 4
                                                      ? Colors.white
                                                      : Color(0xff28676E),
                                                  width: 1.5),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25.0, top: 25),
                                            child: Image.asset(
                                              "assets/images/other.png",
                                              height: 85,
                                              width: 70,
                                              color: Colors.white54,
                                            ),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Other",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            // fontFamily: "Raleway"
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  //                     InkWell(
                                  //                       onTap: () {
                                  //                         setState(() {
                                  //                           choise = 3;
                                  //                         });
                                  //                       },
                                  //                       child: Stack(children: [
                                  //                         Container(
                                  //                           height:
                                  //                               MediaQuery.of(context).size.height *
                                  //                                   0.162439146800501882,
                                  //                           width: 120,
                                  //                           decoration: BoxDecoration(
                                  //                             shape: BoxShape.circle,
                                  //                             color: Color(0xff28676E),
                                  //                             border: Border.all(
                                  //                                 color: choise == 3
                                  //                                     ? Colors.white
                                  //                                     : Color(0xff28676E),
                                  //                                 width: 1.0),
                                  //                           ),
                                  //                         ),
                                  //                         Padding(
                                  //                           padding: const EdgeInsets.only(
                                  //                               left: 25.0, top: 25),
                                  //                           child: Image.asset(
                                  //                             "assets/images/m89.png",
                                  //                             height: 80,
                                  //                             width: 70,
                                  //                           ),
                                  //                         ),
                                  //                       ]),
                                  //                     ),
                                  //                     SizedBox(
                                  //                       width: 8,
                                  //                     ),
                                  //                     InkWell(
                                  //                       onTap: () {
                                  //                         setState(() {
                                  //                           choise = 4;
                                  //                         });
                                  //                       },
                                  //                       child: Stack(children: [
                                  //                         Container(
                                  //                           height:
                                  //                               MediaQuery.of(context).size.height *
                                  //                                   0.162439146800501882,
                                  //                           width: 120,
                                  //                           decoration: BoxDecoration(
                                  //                             shape: BoxShape.circle,
                                  //                             color: Color(0xff28676E),
                                  //                             border: Border.all(
                                  //                                 color: choise == 4
                                  //                                     ? Colors.white
                                  //                                     : Color(0xff28676E),
                                  //                                 width: 1.0),
                                  //                           ),
                                  //                         ),
                                  //                         Padding(
                                  //                           padding: const EdgeInsets.only(
                                  //                               left: 25.0, top: 25),
                                  //                           child: Image.asset(
                                  //                             "assets/images/m89.png",
                                  //                             height: 80,
                                  //                             width: 70,
                                  //                           ),
                                  //                         ),
                                  //                       ]),
                                  //                     ),
                                  //                     SizedBox(
                                  //                       width: 8,
                                  // ),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 10,
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Top Rated",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Raleway")),
              ),
              SizedBox(
                height: 220,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: userController.requests.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: topRatedCard(
                            context, userController.requests[index]),
                      );
                    }),
              ),
              // SizedBox(
              //   height: 25,
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: 20, right: 20),
              //   child: SizedBox(
              //     height: 0.8,
              //     width: double.infinity,
              //     child: Container(
              //       color: Color(0xffD1D1D1),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 25,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20.0),
              //   child: Text("Recommended",
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 20,
              //           fontWeight: FontWeight.w600,
              //           fontFamily: "Raleway")),
              // ),
              // SizedBox(
              //   height: 25,
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       SizedBox(
              //         width: 25,
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) => AppointmentOne()));
              //         },
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //                 height: MediaQuery.of(context).size.height *
              //                     0.162439146800501882,
              //                 width: MediaQuery.of(context).size.width *
              //                     0.6162439146800501882,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image:
              //                           AssetImage("assets/images/pic_one.jpg"),
              //                       fit: BoxFit.cover),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(25.0)),
              //                 ),
              //                 child: Image(
              //                   image: AssetImage("assets/images/pic_one.jpg"),
              //                 )),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(
              //                     left: MediaQuery.of(context).size.width *
              //                         0.017526162439146800501882,
              //                   ),
              //                   child: Text("Fahad's Salon",
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.w600,
              //                           fontFamily: "Raleway")),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(
              //                     left: MediaQuery.of(context).size.width *
              //                         0.2007526162439146800501882,
              //                   ),
              //                   child: Row(
              //                     children: <Widget>[
              //                       Icon(
              //                         Icons.star,
              //                         size: 16,
              //                         color: Color(0xffFFC300),
              //                       ),
              //                       Text(
              //                         '5.0',
              //                         style: TextStyle(),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 25,
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) => AppointmentOne()));
              //         },
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //                 height: MediaQuery.of(context).size.height *
              //                     0.162439146800501882,
              //                 width: MediaQuery.of(context).size.width *
              //                     0.6162439146800501882,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image:
              //                           AssetImage("assets/images/pic_one.jpg"),
              //                       fit: BoxFit.cover),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(25.0)),
              //                 ),
              //                 child: Image(
              //                   image: AssetImage("assets/images/pic_one.jpg"),
              //                 )),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(
              //                     left: MediaQuery.of(context).size.width *
              //                         0.017526162439146800501882,
              //                   ),
              //                   child: Text("ALatif Salon",
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.w600,
              //                           fontFamily: "Raleway")),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(
              //                     left: MediaQuery.of(context).size.width *
              //                         0.2007526162439146800501882,
              //                   ),
              //                   child: Row(
              //                     children: <Widget>[
              //                       Icon(
              //                         Icons.star,
              //                         size: 16,
              //                         color: Color(0xffFFC300),
              //                       ),
              //                       Text(
              //                         '4.8',
              //                         style: TextStyle(),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 25,
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) => AppointmentOne()));
              //         },
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //                 height: MediaQuery.of(context).size.height *
              //                     0.162439146800501882,
              //                 width: MediaQuery.of(context).size.width *
              //                     0.6162439146800501882,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image:
              //                           AssetImage("assets/images/pic_one.jpg"),
              //                       fit: BoxFit.cover),
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(25.0)),
              //                 ),
              //                 child: Image(
              //                   image: AssetImage("assets/images/pic_one.jpg"),
              //                 )),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               children: [
              //                 Padding(
              //                   padding: EdgeInsets.only(
              //                     left: MediaQuery.of(context).size.width *
              //                         0.017526162439146800501882,
              //                   ),
              //                   child: Text("Nail Spa",
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.w600,
              //                           fontFamily: "Raleway")),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(
              //                     left: MediaQuery.of(context).size.width *
              //                         0.2007526162439146800501882,
              //                   ),
              //                   child: Row(
              //                     children: <Widget>[
              //                       Icon(
              //                         Icons.star,
              //                         size: 16,
              //                         color: Color(0xffFFC300),
              //                       ),
              //                       Text(
              //                         '4.7',
              //                         style: TextStyle(),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 25,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 25,
              // ),
            ],
          ),
        ]));
  }

  InkWell topRatedCard(
      BuildContext context, RequestModelAdmin requestModelAdmin) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                AppointmentOne(requestModelAdmin: requestModelAdmin)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.162439146800501882,
            width: MediaQuery.of(context).size.width * 0.6162439146800501882,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/pic_one.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            // child: Image(
            //   image: AssetImage("assets/images/pic_one.jpg"),
            // )
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *
                      0.017526162439146800501882,
                ),
                child: Text(requestModelAdmin.shop!.shopName.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Raleway")),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *
                      0.2007526162439146800501882,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Color(0xffFFC300),
                    ),
                    Text(
                      0.toString(),
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
