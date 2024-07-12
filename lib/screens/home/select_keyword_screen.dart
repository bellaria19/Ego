import 'package:ego/screens/home/memo_screen.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectKeywordScreen extends StatefulWidget {
  // final Function(List<String>) onKeywordsSelected;

  const SelectKeywordScreen({
    super.key,
    // required this.onKeywordsSelected
  });

  @override
  State<SelectKeywordScreen> createState() => _SelectKeywordScreenState();
}

class _SelectKeywordScreenState extends State<SelectKeywordScreen> {
  List<String> keywords = [];

  void setKeywords(List<String> selectedKeywords) {
    setState(() {
      keywords = selectedKeywords;
    });
  }

  List<String> selectedKeywords = [];
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
                  '어떤 키워드가 어울리나요?',
                  style: GoogleFonts.nanumGothicCoding(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 5,
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton.filledTonal(
                          onPressed: () {
                            selectedKeywords.add('happy');
                          },
                          icon: const Icon(FontAwesomeIcons.faceSmileBeam),
                        ),
                        IconButton.filledTonal(
                          onPressed: () {
                            selectedKeywords.add('good');
                          },
                          icon: const Icon(FontAwesomeIcons.faceSmile),
                        ),
                        IconButton.filledTonal(
                          onPressed: () {
                            selectedKeywords.add('meh');
                          },
                          icon: const Icon(FontAwesomeIcons.faceMeh),
                        ),
                        IconButton.filledTonal(
                          onPressed: () {
                            selectedKeywords.add('frown');
                          },
                          icon: const Icon(FontAwesomeIcons.faceFrown),
                        ),
                        IconButton.filledTonal(
                          onPressed: () {
                            selectedKeywords.add('sad');
                          },
                          icon: const Icon(FontAwesomeIcons.faceSadCry),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: selectedKeywords
                            .map((keyword) => Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    keyword,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const MemoScreen(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return child;
                            },
                          ),
                        );
                      },
                      child: const Text('다음'),
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
