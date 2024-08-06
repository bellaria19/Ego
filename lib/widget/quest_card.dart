import 'package:ego/models/quest.dart';
import 'package:ego/services/firestore.dart';
import 'package:ego/utils/constants_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class QuestCard extends StatefulWidget {
  const QuestCard({
    super.key,
    required this.quest,
    required this.docId,
  });

  final Quest quest;
  final String docId;

  @override
  State<QuestCard> createState() => _QuestCardState();
}

class _QuestCardState extends State<QuestCard> {
  FirestoreService firestoreService = FirestoreService();

  void setQuestState(String docId, Quest quest) {
    setState(() {
      quest.setIsComplete();
      firestoreService.updateQuest(docId, quest);
    });
  }

  void setQuestRating(String docId, Quest quest, double rating) {
    setState(() {
      quest.setRating(rating);
      debugPrint('rate: $quest.rate');
      firestoreService.updateQuest(docId, quest);
    });
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 14, top: 4),
                alignment: Alignment.centerLeft,
                child: Text(
                  categoryToString[widget.quest.category] ?? 'Unknown',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, top: 4),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.quest.date.toIso8601String().split('T').first,
                ),
              ),
            ],
          ),
          ListTile(
            title: Text(widget.quest.title),
            trailing: (widget.quest.isComplete)
                ? RatingBar.builder(
                    initialRating: widget.quest.rate?.toDouble() ?? 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setQuestRating(widget.docId, widget.quest, rating);
                    },
                  )
                : TextButton(
                    onPressed: () {
                      setQuestState(
                        widget.docId,
                        widget.quest,
                      );
                    },
                    child: const Text('완료'),
                  ),
          ),
        ],
      ),
    );
  }
}
