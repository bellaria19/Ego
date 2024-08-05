import 'package:ego/models/emotion.dart';
import 'package:ego/screens/home/select_keyword_screen.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:ego/widget/emotion_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectEmotionScreen extends StatefulWidget {
  const SelectEmotionScreen({
    super.key,
  });

  @override
  State<SelectEmotionScreen> createState() => _SelectEmotionScreenState();
}

class _SelectEmotionScreenState extends State<SelectEmotionScreen> {
  String emotion = '';
  late final EmotionType selectedEmotion;

  void onEmotionSelected(EmotionType emotion) {
    setState(() {
      selectedEmotion = emotion;
      debugPrint(selectedEmotion.toString());
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SelectKeywordScreen(emotion: selectedEmotion),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> emotionButtons = [
      {
        'emotion': EmotionType.ecstatic,
        'icon': FontAwesomeIcons.faceSmileBeam,
      },
      {
        'emotion': EmotionType.happy,
        'icon': FontAwesomeIcons.faceSmile,
      },
      {
        'emotion': EmotionType.neutral,
        'icon': FontAwesomeIcons.faceMeh,
      },
      {
        'emotion': EmotionType.unhappy,
        'icon': FontAwesomeIcons.faceFrown,
      },
      {
        'emotion': EmotionType.miserable,
        'icon': FontAwesomeIcons.faceSadCry,
      },
    ];

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
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 5,
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: emotionButtons.map((emotionData) {
                    return EmotionButton(
                      emotion: emotionData['emotion'],
                      icon: emotionData['icon'],
                      onPressed: () =>
                          onEmotionSelected(emotionData['emotion']),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
