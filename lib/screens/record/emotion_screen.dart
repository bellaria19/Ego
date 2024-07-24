import 'package:ego/models/emotion.dart';
import 'package:ego/screens/record/emotion_tile.dart';
import 'package:ego/screens/record/empty_emotion.dart';
import 'package:flutter/material.dart';

class EmotionScreen extends StatefulWidget {
  const EmotionScreen({super.key});

  @override
  State<EmotionScreen> createState() => _EmotionScreenState();
}

class _EmotionScreenState extends State<EmotionScreen> {
  List<Emotion> emotionList = [];

  @override
  void initState() {
    super.initState();
    // Generate and sort emotions initially
    emotionList = generateSampleEmotions(10);
    sortEmotionsByDate();
  }

  void sortEmotionsByDate() {
    emotionList.sort((a, b) => b.date.compareTo(a.date));
  }

  String _selectedYear = DateTime.now().year.toString();
  final List<String> _years =
      List.generate(1, (index) => (DateTime.now().year - index).toString());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _selectedYear,
                  items: _years
                      .map((year) => DropdownMenuItem(
                            value: year,
                            child: Text(year),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedYear = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          emotionList.isEmpty
              ? const EmptyEmotion()
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: emotionList.length,
                    itemBuilder: (context, index) {
                      final emotion = emotionList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EmotionTile(emotion: emotion),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
