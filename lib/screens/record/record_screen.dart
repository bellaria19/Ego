import 'package:ego/screens/record/emotion_screen.dart';
import 'package:ego/screens/record/quest_screen.dart';
import 'package:flutter/material.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [
    "Emotion",
    "Quest",
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 12),
                width: size.width,
                height: size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: tabs.asMap().entries.map((entry) {
                    int index = entry.key;
                    String tab = entry.value;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 10 : 23, top: 7),
                            child: Text(
                              tab,
                              style: TextStyle(
                                fontSize: _selectedIndex == index ? 20 : 16,
                                fontWeight: _selectedIndex == index
                                    ? FontWeight.w500
                                    : FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? 10 : 23, top: 5),
                            height: 2,
                            width: 30,
                            color: _selectedIndex == index
                                ? Colors.black
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: _selectedIndex == 0
                    ? const EmotionScreen()
                    : const QuestScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
