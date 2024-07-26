
import 'package:ego/screens/auth/auth_screen.dart';
import 'package:ego/screens/auth/splash_screen.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
// void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // final apiKey =
  //     Platform.environment['AIzaSyDeFLbJzGszyvtp7-3Vl7O_kad1Pv0NzCk'];
  // if (apiKey == null) {
  //   print('No \$API_KEY environment variable');
  //   exit(1);
  // }

  // final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
  // final content = [Content.text('Write a story about a magic backpack')];
  // final response = await model.generateContent(content);
  // print(response.text);

  // await dotenv.load(fileName: '.env');
  //
  // await Supabase.initialize(
  //   url: dotenv.env['SUPABASE_URL']!,
  //   anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  // );

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
