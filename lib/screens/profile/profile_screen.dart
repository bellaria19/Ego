import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/profile.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(children: const [
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(240, 173, 53, 1),
                ),
                title: Text('Profile Detail'),
              ),
            ),
            ListTile(
              title: Text('Name'),
              subtitle: Text('John Doe'),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text(''),
            ),
          ]),
        ),

        // child: ElevatedButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/profile_detail');
        //   },
        //   child: const Text('Go to Profile Detail'),
        // ),
      ),
    );
  }
}
