import 'package:ego/models/emotion.dart';
import 'package:flutter/material.dart';

class EmotionCard extends StatefulWidget {
  const EmotionCard(
      {super.key, required this.emotion, required this.onPressed});

  final Emotion emotion;
  final void Function() onPressed;

  @override
  State<EmotionCard> createState() => _EmotionCardState();
}

class _EmotionCardState extends State<EmotionCard> {
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
                  onPressed: () => widget.onPressed,
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

  // Future<dynamic> deleteEmotionTile(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Delete Emotion'),
  //         content: const Text('Are you sure you want to delete this emotion?'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               setState(() {
  //                 widget.emotion.removeAt(index);
  //               });
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Delete'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
