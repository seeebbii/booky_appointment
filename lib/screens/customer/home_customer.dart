// import 'package:auto_size_text/auto_size_text.dart';
import 'package:booky/screens/customer/Appoinments.dart';
import 'package:booky/screens/customer/setting.dart';
import 'package:booky/screens/customer/user_home.dart';
import 'package:booky/theme.dart' as color;
import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import 'package:flutter/material.dart';

import 'notification.dart';

class HomeCustomer extends StatefulWidget {
  static String id = 'HomeCustomer';
  @override
  _HomeCustomer createState() => _HomeCustomer();
}

class _HomeCustomer extends State<HomeCustomer> {
  @override
  static const int totalPage = 4;
  static const List<String> names = [
    'Home',
    'Appointments',
    'Notifications',
    'Account',
  ];

  List<Widget> Pages = [
    UserHome(),
    Appoinments(),
    NotificationCustomer(),
    SettingCustomer(),
    // ProfileExp(),
  ];

  List<IconData> icons = [
    Icons.home_outlined,
    Icons.calendar_today,
    Icons.notifications,
    Icons.person_outline
  ];

  static const List<Color> colors = [
    Colors.blueGrey,
    Colors.white,
    Colors.blue,
    Colors.brown
  ];

  int _currentPage = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _getBody(_currentPage),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  Widget _getBottomBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xff25272A),
      currentIndex: _currentPage,
      onTap: (index) {
        _currentPage = index;
        setState(() {});
      },
      selectedItemColor: Color(0xFFfffffff),
      unselectedItemColor: Color(0xff707070),
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        totalPage,
        (index) => BottomNavigationBarItem(
          icon: Icon(
            icons[index],
            size: 30,
          ),
          label: names[index],
        ),
      ),
    );
  }

  Duration duration = Duration(milliseconds: 300);
  Curve curve = Curves.bounceIn;
  TransitionType transitionType = TransitionType.circular;
  String selectedDuration = '300ms';
  String selectedTransactionType = 'Circular';
  String selectedCurve = 'Ease';

  Widget _getBody(int index) {
    return Container(color: Colors.white, child: Pages[index]);
  }

  _getMenuButton(List<String> list, String selectedValue,
      ValueChanged<String> onSelected) {
    return Theme(
      data: ThemeData.dark(),
      child: DropdownButton(
        underline: SizedBox(),
        value: selectedValue,
        items: List.generate(
            list.length,
            (index) => DropdownMenuItem<String>(
                  child: Text(list[index]),
                  value: list[index],
                )),
        //onChanged: onSelected),
      ),
    );
  }
}
