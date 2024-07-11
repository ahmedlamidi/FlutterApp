import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.message,
            size: 20,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.usersRectangle,
            size: 20,
          ),
          label: 'Friends',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.gamepad,
            size: 20,
          ),
          label: 'Games',
        ),
      ],
      selectedItemColor: Colors.grey, // Color for the selected item
      unselectedItemColor: Colors.grey, // Color for the unselected items
      onTap: (int index) {
        switch (index) {
          //navigate to different pages
          case 0:
            break;
          case 1:
            break;
          case 2:
            break;
        }
      },
    );
  }
}
