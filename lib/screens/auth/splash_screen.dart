import 'package:ego/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main_screen.dart';
import 'auth_screen.dart';

/// Page to redirect users to the appropriate page depending on the initial auth state
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   _redirect();
  // }
  //
  // Future<void> _redirect() async {
  //   // await for for the widget to mount
  //   await Future.delayed(Duration.zero);
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //
  //   if (user == null) {
  //     print('No session');
  //     Navigator.of(context).pushNamedAndRemoveUntil('/auth', (route) => false);
  //   } else {
  //     print('Session found');
  //     Navigator.of(context).pushNamedAndRemoveUntil('main', (route) => false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return const AuthScreen();
          } else {
            print(user.email);
            return const MainScreen();
          }
        }
        return const Scaffold(body: preloader);
      },
    );
  }
}
