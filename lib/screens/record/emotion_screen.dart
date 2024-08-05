import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ego/models/emotion.dart';
import 'package:ego/screens/record/empty_emotion.dart';
import 'package:ego/utils/constants.dart';
import 'package:ego/widget/emotion_card.dart';
import 'package:flutter/material.dart';

class EmotionScreen extends StatefulWidget {
  const EmotionScreen({super.key});

  @override
  State<EmotionScreen> createState() => _EmotionScreenState();
}

class _EmotionScreenState extends State<EmotionScreen> {
  List<Emotion> emotionList = [];

  final TextEditingController textController = TextEditingController();

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

  void editMemo(String? docId, Emotion emotion) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              emotion.setMemo(textController.text);
              firestoreService.updateEmotion(docId!, emotion);

              textController.clear();

              Navigator.pop(context);
            },
            child: const Text('edit'),
          ),
        ],
      ),
    );
  }

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
          StreamBuilder<QuerySnapshot>(
            stream: firestoreService.getEmotionsStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List emotionsList = snapshot.data!.docs;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: emotionsList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = emotionsList[index];
                      String docId = document.id;

                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      final emotion = Emotion.fromMap(data);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EmotionCard(
                          emotion: emotion,
                          onPressed: () => editMemo(docId, emotion),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const EmptyEmotion();
              }
            },
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
                        child: EmotionCard(
                          emotion: emotion,
                          onPressed: () => editMemo('1', emotion),
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
