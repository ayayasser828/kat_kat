//
//
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_kat/constant/constant.dart';
import 'package:kat_kat/screens/profile_setting.dart';
import 'package:kat_kat/widgets/custom_bottom_sheetProfile.dart';



class BottomNav extends StatefulWidget {
  static const String routeName = "/BottomNav";

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.of(context).pushNamed(ProfileSetting.routeName);
      } else if (index == 2) {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => CustomBottomSheetProfile(),
          backgroundColor: Colors.transparent,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        child: BottomNavigationBar(
          backgroundColor: colorm2,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.clock,
                color: Colors.white,
              ),
              title: Text(
                ' ',
                style: TextStyle(fontSize: 1),
              ),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.home,
                color: Colors.white,
              ),
              title: Text(
                ' ',
                style: TextStyle(fontSize: 1),
              ),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.userAlt,
                color: Colors.white,
              ),
              title: Text(
                ' ',
                style: TextStyle(fontSize: 1),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
