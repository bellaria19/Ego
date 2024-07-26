import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({
    super.key,
    required this.onPressed,
    this.text = 'Sign in with Google',
    this.height = 44,
  });

  final VoidCallback onPressed;

  final String text;

  final double height;

  final borderRadius = const BorderRadius.all(Radius.circular(8.0));

  @override
  Widget build(BuildContext context) {
    // per Apple's guidelines
    final fontSize = height * 0.43;

    final textWidget = Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        inherit: false,
        fontSize: fontSize,
        color: Colors.black,
        fontFamily: '.SF Pro Text',
        letterSpacing: -0.41,
      ),
    );

    return SizedBox(
      height: height,
      child: SizedBox.expand(
        child: CupertinoButton(
          borderRadius: borderRadius,
          padding: EdgeInsets.zero,
          color: Colors.white,
          onPressed: onPressed,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: borderRadius,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/google.png'),
                Flexible(
                  child: textWidget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
