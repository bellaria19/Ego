import 'package:flutter/material.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});
  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/quest_one.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/quest_detail');
            },
            child: const Text('Go to Quest Detail'),
          ),
        ),
      ),
    );
  }
}
