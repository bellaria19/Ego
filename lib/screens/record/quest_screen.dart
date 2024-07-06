import 'package:flutter/material.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  final List questList = [
    {
      "date": "4월 26일",
      "time": "오후 09:11",
      "emotion1": "이유 없음",
      "emotion2": "감사한"
    },
    {
      "date": "3월 15일",
      "time": "오후 02:18",
      "emotion1": "이유 없음",
      "emotion2": "슬픈"
    },
    {"date": "3월 15일", "time": "오후 02:18", "emotion1": "돈", "emotion2": "희망찬"},
    {
      "date": "3월 15일",
      "time": "오후 02:07",
      "emotion1": "공부",
      "emotion2": "열정적인"
    },
  ];

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
          questList.isEmpty
              ? const Text('No Emotion Data')
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: questList.length,
                  itemBuilder: (context, index) {
                    final emotion = questList[index];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.sentiment_satisfied),
                        ),
                        title: Text('${emotion["date"]} ${emotion["time"]}'),
                        subtitle: Wrap(
                          spacing: 8.0,
                          children: [
                            Chip(label: Text(emotion["emotion1"]!)),
                            Chip(label: Text(emotion["emotion2"]!)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
