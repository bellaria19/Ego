import 'package:ego/models/emotion.dart';
import 'package:ego/screens/record/empty_emotion.dart';
import 'package:flutter/material.dart';

class EmotionScreen extends StatefulWidget {
  const EmotionScreen({super.key});

  @override
  State<EmotionScreen> createState() => _EmotionScreenState();
}

class _EmotionScreenState extends State<EmotionScreen> {
  List<Emotion> dummyEmotions = generateSampleEmotions(10);

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
          dummyEmotions.isEmpty
              ? const EmptyEmotion()
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: dummyEmotions.length,
                    itemBuilder: (context, index) {
                      final emotion = dummyEmotions[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                padding: const EdgeInsets.only(left: 8),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  emotion.date.toString(),
                                ),
                              ),
                              ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(Icons.sentiment_satisfied),
                                ),
                                title: Text(emotion.keyword),
                                subtitle: Text(emotion.memo.isNotEmpty
                                    ? emotion.memo
                                    : 'Write a memo'),
                                trailing: Wrap(
                                  spacing: 12,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          dummyEmotions.removeAt(index);
                                        });
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
