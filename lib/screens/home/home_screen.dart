import 'package:ego/screens/home/home_set_screen.dart';
import 'package:ego/screens/home/select_mood_screen.dart';
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
  String selectedEmotion = '';

  void _onEmotionSelected(String emotion) {
    setState(() {
      selectedEmotion = emotion;
      print(selectedEmotion);
    });
  }

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const DayReward();
                                },
                              );
                            },
                            icon: const Icon(FontAwesomeIcons.bone)),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(HomeSetScreen.route());
                          },
                          icon: const Icon(FontAwesomeIcons.gear),
                        ),
                      ],
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

class DayReward extends StatelessWidget {
  const DayReward({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Icon(
                  //     FontAwesomeIcons.bone),
                  const Text(
                    '오늘의 보상',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(FontAwesomeIcons.xmark),
                  ),
                ],
              ),
              const Divider(),
              // Text('매일 0시 초기화'),
              formSpacer,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('일일 퀘스트'),
                  Text('0/1'),
                ],
              ),
              formSpacer,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('퀘스트 명'),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('GO'),
                    ),
                  ],
                ),
              ),
              formSpacer,
              const Row(
                children: [
                  Text('출석 보너스'),
                  SizedBox(width: 8),
                  Text('+100'),
                ],
              ),
              formSpacer,
            ],
          )),
      // title: const Text('Popup'),
    );
  }
}
