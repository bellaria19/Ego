import 'package:ego/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendScreen extends StatelessWidget {
  const RecommendScreen({
    super.key,
  });

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
                  '키워드와 관련된 퀘스트\n추천을 받으시겠어요?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nanumGothicCoding(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MainScreen.route(), (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.black),
                      child: const Text('괜찮아'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MainScreen.route(), (route) => false);
                        // Navigator.of(context).push(
                        //   PageRouteBuilder(
                        //     pageBuilder:
                        //         (context, animation, secondaryAnimation) =>
                        //             const RecommendScreen(),
                        //     transitionsBuilder: (context, animation,
                        //         secondaryAnimation, child) {
                        //       return child;
                        //     },
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.black),
                      child: const Text('좋아'),
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
