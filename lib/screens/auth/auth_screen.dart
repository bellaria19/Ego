import 'package:ego/main.dart';
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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text('Start with \nEgo....'),
            const Divider(),
            formSpacer,
            SignInWithGoogleButton(onPressed: () {
              signInWithGoogle();
            }),
            formSpacer,
            SignInWithAppleButton(onPressed: () {
              signInWithApple();
            }),
          ],
        ),
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
        builder: (context) => MyApp(),
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
        builder: (context) => MyApp(),
      ));
    }).onError((error, stackTrace) {
      print('error $error');
    });
  }
}
