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
            debugPrint(user.email);
            return const MainScreen();
          }
        }
        return const Scaffold(body: preloader);
      },
    );
  }
}
