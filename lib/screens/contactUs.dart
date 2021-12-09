import 'package:flutter/material.dart';

import '../../theme.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox.expand(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 45),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop()
                  // onPressed: () {},
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15793),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/logoWithoutName.png"),
                          Text(
                            "Contact Us",
                            style: TextStyle(
                                fontSize: 24,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("If you need any help, you can contact us via",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "E-mail:",
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        Text("Boooky.App@gmail.com",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Phone number:",
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        Text("0506101582",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
