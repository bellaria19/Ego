import 'package:ego/screens/auth/auth_screen.dart';
import 'package:ego/screens/auth/splash_screen.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

// Future<void> main() async {
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EGO',
      theme: appTheme,
      // home: const SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => const AuthScreen(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
