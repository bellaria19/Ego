import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(children: [
            const Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(240, 173, 53, 1),
                ),
                title: Text('Profile Detail'),
              ),
            ),
            const ListTile(
              title: Text('Name'),
              subtitle: Text('John Doe'),
            ),
            const ListTile(
              title: Text('Email'),
              subtitle: Text(''),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushNamed(context, '/auth');
              },
              label: const Text('Logout'),
            )
          ]),
        ),
      ),
    );
  }
}
