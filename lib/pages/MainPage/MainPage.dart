import 'package:dokter_app/config/ColorConfig.dart';
import 'package:dokter_app/pages/MainPage/DokterPage.dart';
import 'package:dokter_app/pages/MainPage/HomePage.dart';
import 'package:dokter_app/pages/MainPage/ProfilePage.dart';
import 'package:dokter_app/pages/MainPage/SchedulePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fontisto.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/icons8.dart';
import 'package:iconify_flutter/icons/maki.dart';
import 'package:iconify_flutter/icons/map.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/vaadin.dart';
import 'package:iconsax/iconsax.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List _pages = [
    const HomePage(),
    const DokterPage(),
    const SchedulePage(),
    const ProfilePage(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Exit App'),
              content: Text('Are you sure you want to exit the app?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Yes'),
                ),
              ],
            );
          },
        );
        return false;
      },
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              activeIcon: Icon(Iconsax.home5),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Iconify(
                Healthicons.doctor_outline,
                color: Colors.grey.shade400,
                size: 27,
              ),
              activeIcon: Iconify(Healthicons.doctor,
                  color: ColorConfig.primaryColor, size: 27),
              label: 'Dokter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.calendar_1),
              activeIcon:
                  Icon(Iconsax.calendar5, color: ColorConfig.primaryColor),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ColorConfig.primaryColor,
          unselectedItemColor: Colors.grey[400],
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
