import 'package:booky/model/request_model_admin.dart';
import 'package:booky/theme.dart';
import 'package:flutter/material.dart';

import 'appointmet_one.dart';

// const stylistData = [
//   {
//     'salonName': 'Abdullah',
//     'rating': '4.8',
//     'rateAmount': '56',
//     'imgUrl': 'assets/images/pic_one.jpg',
//     'bgColor': Color(0xffcbdfe2),
//   },
//   {
//     'salonName': 'Fahad',
//     'rating': '4.7',
//     'rateAmount': '80',
//     'imgUrl': 'assets/images/pic_two.jpg',
//     'bgColor': Color(0xffEBF6FF),
//   },
//   {
//     'salonName': 'Abdullah Fahad',
//     'rating': '4.7',
//     'rateAmount': '70',
//     'imgUrl': 'assets/images/pic_one.jpg',
//     'bgColor': Color(0xffcbdfe2),
//   }
// ];

class CardScreen extends StatelessWidget {
  static String id = "CardScreen";
  final List<RequestModelAdmin>? categorylist;

  // late String title;
  static String title = "Car Wash List";

  const CardScreen({Key? key, this.categorylist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop()
                        // onPressed: () {},
                        ),
                    Text(
                      title,
                      style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: ListView.builder(
                      itemCount: categorylist?.length ?? 0,
                      itemBuilder: (context, index) {
                        return StylistCard(categorylist![index]);
                      }),
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     SizedBox(
                  //       height: 20,
                  //     ),
                  //     StylistCard(stylistData[0]),
                  //     StylistCard(stylistData[1]),
                  //     StylistCard(stylistData[2]),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StylistCard extends StatelessWidget {
  RequestModelAdmin requestModelAdmin;
  StylistCard(this.requestModelAdmin);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4 - 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffEBF6FF),
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 150.0, top: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/pic_one.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.45,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  requestModelAdmin.shop!.shopName.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Color(0xffFFC300),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      requestModelAdmin.user!.rating.toString(),
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AppointmentOne(
                          requestModelAdmin: requestModelAdmin))),
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Book',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
