import 'package:ego/screens/home/select_keyword_screen.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectMoodScreen extends StatefulWidget {
  // final Function(String) onMoodSelected;

  const SelectMoodScreen({
    super.key,
    // required this.onMoodSelected,
  });

  // static Route<void> route() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         SelectMoodScreen(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return child;
  //     },
  //   );
  // }

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
                        onMoodSelected('happy');
                      },
                      icon: const Icon(FontAwesomeIcons.faceSmileBeam),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        onMoodSelected('good');
                      },
                      icon: const Icon(FontAwesomeIcons.faceSmile),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        onMoodSelected('meh');
                      },
                      icon: const Icon(FontAwesomeIcons.faceMeh),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        onMoodSelected('frown');
                      },
                      icon: const Icon(FontAwesomeIcons.faceFrown),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        onMoodSelected('sad');
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
