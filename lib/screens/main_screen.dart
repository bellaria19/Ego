import 'package:ego/models/tab_items.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'chat/chat_screen.dart';
import 'history/history_screen.dart';
import 'home/home_screen.dart';
import 'record/record_screen.dart';
import 'profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const MainScreen(),
    );
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List _widgetOptions = [
    const ChatScreen(), // Chat
    const HistoryScreen(), // History
    const HomeScreen(), // Home
    RecordScreen(), // Quest
    const ProfileScreen(), // Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(50.0),
      //   child: AppBar(
      //     title: Text(
      //       tabs[_selectedIndex].label,
      //       style: const TextStyle(
      //         color: Colors.black,
      //         fontSize: 20,
      //         fontWeight: FontWeight.normal,
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _selectedIndex,
          indicatorColor: const Color.fromRGBO(240, 173, 53, 1),
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.solidComment),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.squarePollVertical),
              label: 'History',
            ),
            NavigationDestination(
              selectedIcon: Icon(FontAwesomeIcons.houseChimney),
              icon: Icon(FontAwesomeIcons.plus),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.book),
              label: 'Quest',
            ),
            NavigationDestination(
              icon: Icon(FontAwesomeIcons.addressBook),
              label: 'Profile',
            ),
          ]

          // destinations.map(
          //   (NavigationDestination dest) {
          //     return NavigationDestination(
          //       icon: dest.icon,
          //       label: dest.label,
          //     );
          //   },
          // ).toList(),
          ),
    );
  }
}
