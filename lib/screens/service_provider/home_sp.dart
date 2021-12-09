import 'package:booky/screens/service_provider/profile_sp.dart';
import 'package:booky/theme.dart' as color;
import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import 'package:flutter/material.dart';

import 'appointment_sp.dart';


class HomeServiceProvider extends StatefulWidget {
  static String id = 'HomeServiceProvider';
  @override
  _HomeServiceProvider createState() => _HomeServiceProvider();
}

class _HomeServiceProvider extends State<HomeServiceProvider> {
  @override
  static const int totalPage = 2;
  static const List<String> names = [
    'Appointments',
    'Profile',
  ];

  List<Widget> Pages = [
    AppointmentServiceProvider(),
    ProfileServiceProvider(),
  ];

  List<IconData> icons = [
    Icons.calendar_today,
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
