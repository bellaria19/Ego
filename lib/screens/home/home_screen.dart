import 'package:ego/screens/home/day_reward.dart';
import 'package:ego/screens/home/select_emotion_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/home.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const DayReward();
                          },
                        );
                      },
                      icon: const Icon(FontAwesomeIcons.bone),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SelectMoodScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
