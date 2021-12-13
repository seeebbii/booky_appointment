import 'package:booky/controller/admin/admin_controller.dart';
import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/controller/shops/shop_service.dart';
import 'package:booky/controller/user/admin_services.dart';
import 'package:booky/screens/Login/login_page.dart';
import 'package:booky/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AdminHome extends StatefulWidget {
  static String id = "AdminHome";
  @override
  _AdminHome createState() => _AdminHome();
}

class _AdminHome extends State<AdminHome> {
  AdminController adminController = Get.put(AdminController());
  final authController = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {
                      authController.logOut();
                      Get.offAll(() => LoginPage());
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
                child: Text(
                  "Service Providers Requests:",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height / 6 - 10,
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
                      child: StreamBuilder(
                          stream: AdminServices().getAllShops(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Expanded(
                                  child: ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: <Widget>[
                                            ListTile(
                                              title: Text(
                                                snapshot.data[index].shop!
                                                    .shopName!,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              trailing: snapshot.data[index]
                                                          .shop!.status !=
                                                      "Requested"
                                                  ? Text(snapshot
                                                      .data[index].shop!.status
                                                      .toString())
                                                  : Wrap(children: <Widget>[
                                                      MaterialButton(
                                                        onPressed: () {
                                                          ShopServices
                                                              .rejectRequest(
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .docid!,
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .shop!,
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .user!);
                                                        },
                                                        color: Colors.red,
                                                        textColor: Colors.white,
                                                        child: Icon(
                                                          Icons.close,
                                                          // color: Colors.red,
                                                          size: 24,
                                                        ),
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        shape: CircleBorder(),
                                                      ),
                                                      MaterialButton(
                                                        onPressed: () {
                                                          ShopServices
                                                              .acceptRequest(
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .docid!,
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .shop!,
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .user!);
                                                        },
                                                        color: Colors.green,
                                                        textColor: Colors.white,
                                                        child: Icon(
                                                          Icons.check,
                                                          size: 24,
                                                        ),
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        shape: CircleBorder(),
                                                      ),
                                                    ]),
                                            ),
                                            Divider(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              thickness: 1,
                                              indent: 10,
                                              endIndent: 10,
                                              color: kAppDividerColor,
                                            ),
                                          ],
                                        );
                                      }));
                            }
                            return Container(
                              child: Center(child: CircularProgressIndicator()),
                            );
                          })))
            ])));
  }
}

final serviceProviderList = [
  'Abdullah Barber Shop',
  'Fahad Car Wash',
  'Mohammed Women Salon',
  'Mohsen trainer',
  'Abdullah Barber Shop',
  'Fahad Car Wash',
  'Mohammed Women Salon',
  'Mohsen trainer',
  'Abdullah Barber Shop',
  'Fahad Car Wash',
  'Mohammed Women Salon',
  'Mohsen trainer',
];
