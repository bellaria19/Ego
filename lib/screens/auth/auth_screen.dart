import 'package:ego/screens/main_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:ego/widget/auth_google_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const AuthScreen());
  }

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Start with \nEgo....',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(),
          formSpacer,
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SignInWithGoogleButton(onPressed: () {
                    signInWithGoogle();
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SignInWithAppleButton(onPressed: () {
                    signInWithApple();
                  }),
                ),
                formSpacer,
              ],
            ),
          ),
          formSpacer,
        ],
      ),
    );
  }

  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      print(value.user?.email);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ));
    }).onError((error, stackTrace) {
      print('error $error');
    });
  }

  void signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    await FirebaseAuth.instance.signInWithProvider(appleProvider).then((value) {
      print(value.user?.email);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ));
    }).onError((error, stackTrace) {
      print('error $error');
    });
  }
}
