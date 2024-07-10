import 'package:ego/screens/home/select_emotion_screen.dart';
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
                const Padding(padding: EdgeInsets.all(16)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.bone)),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          // Add your code here
                        },
                        icon: const Icon(FontAwesomeIcons.gear),
                      ),
                    ],
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
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton.filledTonal(
                        onPressed: () {
                          _onEmotionSelected('happy');
                        },
                        icon: const Icon(FontAwesomeIcons.faceSmileBeam),
                      ),
                      IconButton.filledTonal(
                        onPressed: () {
                          _onEmotionSelected('smile');
                        },
                        icon: const Icon(FontAwesomeIcons.faceSmile),
                      ),
                      IconButton.filledTonal(
                        onPressed: () {
                          _onEmotionSelected('meh');
                        },
                        icon: const Icon(FontAwesomeIcons.faceMeh),
                      ),
                      IconButton.filledTonal(
                        onPressed: () {
                          _onEmotionSelected('frown');
                        },
                        icon: const Icon(FontAwesomeIcons.faceFrown),
                      ),
                      IconButton.filledTonal(
                        onPressed: () {
                          _onEmotionSelected('sad');
                        },
                        icon: const Icon(FontAwesomeIcons.faceSadCry),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
