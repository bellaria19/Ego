import 'package:flutter/material.dart';

class ExplainText extends StatelessWidget {
  const ExplainText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }
}
