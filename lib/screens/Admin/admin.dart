import 'package:booky/controller/admin/admin_controller.dart';
import 'package:booky/controller/authentication/auth_controller.dart';
import 'package:booky/controller/shops/shop_service.dart';
import 'package:booky/screens/Login/login_page.dart';
import 'package:booky/screens/customer/notification.dart';
import 'package:booky/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class AdminHome extends StatefulWidget {
  static String id = "AdminHome";
  @override
  _AdminHome createState() => _AdminHome();
}

class _AdminHome extends State<AdminHome> {
  AdminController adminController = Get.put(AdminController());
  @override
  void initState() {
    adminController.getAppointments();
    super.initState();
  }
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(onPressed: () {
                    authController.logOut();
                    Get.offAll(() => LoginPage());
                  }, icon: Icon(Icons.logout, color: Colors.white ,),)
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
                    child: Obx(
                      () => RefreshIndicator(
                        onRefresh: () =>  adminController.getAppointments(),
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemCount: adminController.requests.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    adminController
                                        .requests[index].shop!.shopName!,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),

                                  trailing: adminController.requests[index].shop!.status != "Requested" ? Text(adminController.requests[index].shop!.status.toString()) : Wrap(children: <Widget>[
                                    MaterialButton(
                                      onPressed: () {
                                        ShopServices.rejectRequest( adminController.requests[index].docid! ,adminController.requests[index].shop!, adminController.requests[index].user!).then((value) => adminController.getAppointments());
                                      },
                                      color: Colors.red,
                                      textColor: Colors.white,
                                      child: Icon(
                                        Icons.close,
                                        // color: Colors.red,
                                        size: 24,
                                      ),
                                      padding: EdgeInsets.all(10),
                                      shape: CircleBorder(),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        ShopServices.acceptRequest( adminController.requests[index].docid! ,adminController.requests[index].shop!, adminController.requests[index].user!).then((value) => adminController.getAppointments());
                                      },
                                      color: Colors.green,
                                      textColor: Colors.white,
                                      child: Icon(
                                        Icons.check,
                                        size: 24,
                                      ),
                                      padding: EdgeInsets.all(10),
                                      shape: CircleBorder(),
                                    ),
                                  ]),
                                ),
                                Divider(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                  color: kAppDividerColor,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    )),
              )
            ],
          ),
        ));
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
