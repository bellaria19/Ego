import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'chat/chat_screen.dart';
import 'home/home_screen.dart';
import 'profile/profile_screen.dart';
import 'record/record_screen.dart';
import 'statistics/statistics_screen.dart';

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
  int _selectedIndex = 2;

  final List<NavigationDestination> _navigationDestination = const [
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.solidComment),
      label: 'Chat',
    ),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.squarePollVertical),
      label: 'Stats',
    ),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.houseChimney),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.book),
      label: 'Record',
    ),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.addressBook),
      label: 'Profile',
    ),
  ];

  final List _widgetOptions = const [
    ChatScreen(), // Chat
    StatisticsScreen(), // History
    HomeScreen(), // Home
    RecordScreen(), // Quest
    ProfileScreen(), // Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: Colors.white,
        selectedIndex: _selectedIndex,
        // indicatorColor: Colors.amber,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: _navigationDestination.map(
          (NavigationDestination dest) {
            return NavigationDestination(
              icon: dest.icon,
              label: dest.label,
            );
          },
        ).toList(),
      ),
    );
  }
}
