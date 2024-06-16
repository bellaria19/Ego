import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabInfo {
  final IconData icon;
  final String label;
  final List<Widget>? actions;

  const TabInfo({
    required this.icon,
    required this.label,
    this.actions,
  });
}

const tabs = [
  TabInfo(icon: FontAwesomeIcons.solidComment, label: 'Chat'),
  TabInfo(icon: FontAwesomeIcons.squarePollVertical, label: 'History'),
  TabInfo(icon: FontAwesomeIcons.houseChimney, label: 'Home'),
  TabInfo(icon: FontAwesomeIcons.book, label: 'Quest'),
  TabInfo(icon: FontAwesomeIcons.addressBook, label: 'Profile'),
];

const destinations = [
  NavigationDestination(
      icon: Icon(FontAwesomeIcons.solidComment), label: 'Chat'),
  NavigationDestination(
      icon: Icon(FontAwesomeIcons.squarePollVertical), label: 'History'),
  NavigationDestination(
      icon: Icon(FontAwesomeIcons.houseChimney), label: 'Home'),
  NavigationDestination(icon: Icon(FontAwesomeIcons.book), label: 'Quest'),
  NavigationDestination(
      icon: Icon(FontAwesomeIcons.addressBook), label: 'Profile'),
];
