import 'package:ego/models/emotion.dart';
import 'package:flutter/material.dart';

class EmotionTile extends StatelessWidget {
  const EmotionTile({super.key, required this.emotion});

  final Emotion emotion;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                emotion.date.toString(),
              ),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.sentiment_satisfied),
            ),
            title: Text(emotion.keyword),
            subtitle:
                Text(emotion.memo.isNotEmpty ? emotion.memo : 'Write a memo'),
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
                    deleteEmotionTile(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> deleteEmotionTile(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Emotion'),
          content: const Text('Are you sure you want to delete this emotion?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // setState(() {
                //   dummyEmotions.removeAt(index);
                // });
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
