import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ego/screens/auth/splash_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
// void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
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
      home: const SplashScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const SplashScreen(),
      // '/signIn': (context) => const AuthScreen(),
      // },
    );
  }
}
