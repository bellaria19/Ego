import 'package:ego/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:ego/screens/auth/register_screen.dart';
import 'package:ego/utils/constants.dart';

/// Page to redirect users to the appropriate page depending on the initial auth state
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    // await for for the widget to mount
    await Future.delayed(Duration.zero);

    final session = supabase.auth.currentSession;
    if (session == null) {
      print('No session');
      Navigator.of(context)
          .pushAndRemoveUntil(RegisterScreen.route(), (route) => false);
    } else {
      print('Session found');
      Navigator.of(context)
          .pushAndRemoveUntil(MainScreen.route(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: preloader);
  }
}
