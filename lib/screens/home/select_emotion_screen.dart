import 'package:ego/screens/home/select_keyword_screen.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// List<String> emotionStages = [
//   "매우 좋음 (Ecstatic)",
//   "좋음 (Happy)",
//   "보통 (Neutral)",
//   "나쁨 (Unhappy)",
//   "매우 나쁨 (Miserable)"
// ];

class SelectMoodScreen extends StatefulWidget {
  const SelectMoodScreen({
    super.key,
  });

  @override
  State<SelectMoodScreen> createState() => _SelectMoodScreenState();
}

class _SelectMoodScreenState extends State<SelectMoodScreen> {
  String mood = '';

  void onMoodSelected(String selectedMood) {
    setState(() {
      mood = selectedMood;
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SelectKeywordScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MainScreen.route());
            },
            icon: const Icon(FontAwesomeIcons.xmark),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  '지금 어떤 기분이세요?',
                  style: GoogleFonts.nanumGothicCoding(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 5,
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton.filledTonal(
                      onPressed: () {
                        onMoodSelected('Ecstatic');
                      },
                      icon: const Icon(FontAwesomeIcons.faceSmileBeam),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        onMoodSelected('Happy');
                      },
                      icon: const Icon(FontAwesomeIcons.faceSmile),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        onMoodSelected('Neutral');
                      },
                      icon: const Icon(FontAwesomeIcons.faceMeh),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        onMoodSelected('Unhappy');
                      },
                      icon: const Icon(FontAwesomeIcons.faceFrown),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        onMoodSelected('Miserable');
                      },
                      icon: const Icon(FontAwesomeIcons.faceSadCry),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
