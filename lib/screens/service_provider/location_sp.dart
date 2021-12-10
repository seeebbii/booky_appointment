import 'package:booky/controller/service_provider/service_provider_controller.dart';
import 'package:booky/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'business_hours_one.dart';

class LocationSp extends StatefulWidget {
  static String id = "LocationSp";
  const LocationSp({Key? key}) : super(key: key);

  @override
  _LocationSp createState() => _LocationSp();
}

class _LocationSp extends State<LocationSp> {
  bool boolean = true;
  final spController = Get.find<ServiceProvider>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool validateAndSaveUser() {
    final form = formkey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  submitLocationAndCategory() {
// there you can perfom any firestore functionality
    if (validateAndSaveUser()) {
      debugPrint(spController.locationController.text);
      debugPrint(spController.choise.value.toString());
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BusinessHoursOne()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: kWhiteColor,
      body: Obx(
        () => ListView(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.37,
                          top: MediaQuery.of(context).size.width * 0.125),
                      child: Image(
                          image: const AssetImage(
                              'assets/images/logoWithoutName.png')),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 100.0, top: 0),
                    // ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                'Choose Your Business Catogry',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      // color: kAppDividerColor,

                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          boolean
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
                                          setState(() {
                                            spController.choise.value = 0;
                                            print(spController.choise);
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
                                                  color: spController
                                                              .choise.value ==
                                                          0
                                                      ? Color(0xff28676E)
                                                      : kLightGray,
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
                                              "Car Wash",
                                              style: TextStyle(
                                                color: kBlackColor,
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
                                          setState(() {
                                            spController.choise.value = 1;
                                            print(spController.choise);
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
                                                  color: spController
                                                              .choise.value ==
                                                          1
                                                      ? Color(0xff28676E)
                                                      : kLightGray,
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
                                                color: kBlackColor,
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
                                          setState(() {
                                            spController.choise.value = 2;
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
                                                  color: spController
                                                              .choise.value ==
                                                          2
                                                      ? Color(0xff28676E)
                                                      : kLightGray,
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
                                                color: kBlackColor,
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
                                          setState(() {
                                            spController.choise.value = 3;
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
                                                  color: spController
                                                              .choise.value ==
                                                          3
                                                      ? Color(0xff28676E)
                                                      : kLightGray,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25.0, top: 25),
                                                child: Image.asset(
                                                  "assets/images/weightlifter.png",
                                                  height: 90,
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
                                                color: kBlackColor,
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
                                          setState(() {
                                            spController.choise.value = 4;
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
                                                  color: spController
                                                              .choise.value ==
                                                          4
                                                      ? Color(0xff28676E)
                                                      : kLightGray,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25.0, top: 25),
                                                child: Image.asset(
                                                  "assets/images/other.png",
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
                                              "Other",
                                              style: TextStyle(
                                                color: kBlackColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                // fontFamily: "Raleway"
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  height: 10,
                                ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 30,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                'Select Your Business Location',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Form(
                      key: formkey,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: spController.locationController,
                          keyboardType: TextInputType.url,
                          cursorColor: Color(0xFFA1A1A1),
                          textAlign: TextAlign.left,
                          validator: (value) {
                            return (value!.isEmpty)
                                ? "location can't Empity"
                                : null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 10),
                            hintText: "Search Here",
                            prefixIcon: Icon(
                              Icons.location_pin,
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
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
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
                              onPressed: () => Get.back(),
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
                                onPressed: () => submitLocationAndCategory()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
