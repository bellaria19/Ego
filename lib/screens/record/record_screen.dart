import 'package:ego/screens/record/emotion_screen.dart';
import 'package:ego/screens/record/quest_screen.dart';
import 'package:flutter/material.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [
    "Emotion",
    "Quest",
  ];
  int _selectedIndex = 0;

  double changePositionedOfLine() {
    switch (_selectedIndex) {
      case 0:
        return 0;
      case 1:
        return 78;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (_selectedIndex) {
      case 0:
        return 50;
      case 1:
        return 80;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                width: size.width,
                height: size.height * 0.05,
                child: Stack(
                  children: [
                    Positioned(
                      // top: 0,
                      // left: 0,
                      // right: 0,
                      child: SizedBox(
                        width: size.width,
                        height: size.height * 0.04,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: tabs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0 ? 10 : 23, top: 7),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                    });
                                  },
                                  child: Text(
                                    tabs[index],
                                    style: TextStyle(
                                      fontSize:
                                          _selectedIndex == index ? 20 : 16,
                                      fontWeight: _selectedIndex == index
                                          ? FontWeight.w500
                                          : FontWeight.w300,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _selectedIndex == 0 ? EmotionScreen() : QuestScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
