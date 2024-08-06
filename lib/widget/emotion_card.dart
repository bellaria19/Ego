import 'package:ego/models/emotion.dart';
import 'package:ego/services/firestore.dart';
import 'package:flutter/material.dart';

class EmotionCard extends StatefulWidget {
  const EmotionCard({
    super.key,
    required this.emotion,
    this.docId,
  });

  final Emotion emotion;
  final String? docId;

  @override
  State<EmotionCard> createState() => _EmotionCardState();
}

class _EmotionCardState extends State<EmotionCard> {
  FirestoreService firestoreService = FirestoreService();
  TextEditingController textController = TextEditingController();

  void editMemo(String? docId, Emotion emotion) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: 'Type a memo',
          ),
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
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 12, top: 4),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.emotion.date.toIso8601String().split('T').first,
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.sentiment_satisfied),
            ),
            title: Text(widget.emotion.keyword),
            subtitle: Text(widget.emotion.memo.isNotEmpty
                ? widget.emotion.memo
                : 'Write a memo'),
            trailing: Wrap(
              spacing: 12,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => editMemo(
                    widget.docId,
                    widget.emotion,
                  ),
                ),
                // IconButton(
                //   icon: const Icon(Icons.delete),
                //   onPressed: () {
                //     deleteEmotionTile(context);
                //   },
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
