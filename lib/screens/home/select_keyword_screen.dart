import 'package:ego/screens/home/memo_screen.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectKeywordScreen extends StatefulWidget {
  const SelectKeywordScreen({
    super.key,
  });

  @override
  State<SelectKeywordScreen> createState() => _SelectKeywordScreenState();
}

class _SelectKeywordScreenState extends State<SelectKeywordScreen> {
  String keyword = '';

  void setKeyword(String selectedKeyword) {
    setState(() {
      keyword = selectedKeyword;
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
                  '어떤 키워드가 어울리나요?',
                  style: GoogleFonts.nanumGothicCoding(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: const EdgeInsets.all(16),
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
                            setKeyword('Ecstatic');
                          },
                          icon: const Icon(FontAwesomeIcons.faceSmileBeam),
                        ),
                        IconButton.filledTonal(
                          onPressed: () {
                            setKeyword('Happy');
                          },
                          icon: const Icon(FontAwesomeIcons.faceSmile),
                        ),
                        IconButton.filledTonal(
                          onPressed: () {
                            setKeyword('Neutral');
                          },
                          icon: const Icon(FontAwesomeIcons.faceMeh),
                        ),
                        IconButton.filledTonal(
                          onPressed: () {
                            setKeyword('Unhappy');
                          },
                          icon: const Icon(FontAwesomeIcons.faceFrown),
                        ),
                        IconButton.filledTonal(
                          onPressed: () {
                            setKeyword('Miserable');
                          },
                          icon: const Icon(FontAwesomeIcons.faceSadCry),
                        ),
                      ],
                    ),
                    formSpacer,
                    if (keyword != '')
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Card(
                          child: Row(
                            children: [
                              Text(keyword),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      keyword = '';
                                    });
                                  },
                                  icon:
                                      const Icon(FontAwesomeIcons.circleXmark))
                            ],
                          ),
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
