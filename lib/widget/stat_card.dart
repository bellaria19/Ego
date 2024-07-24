import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final Widget child;

  const StatCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
