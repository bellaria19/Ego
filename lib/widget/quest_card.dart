import 'package:ego/models/quest.dart';
import 'package:ego/utils/constants_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class QuestCard extends StatefulWidget {
  const QuestCard({
    super.key,
    required this.quest,
  });

  final Quest quest;

  @override
  State<QuestCard> createState() => _QuestCardState();
}

class _QuestCardState extends State<QuestCard> {
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
                    initialRating: widget.quest.rate!.toDouble(),
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
                      debugPrint(rating.toString());
                    },
                  )
                : TextButton(
                    onPressed: () {
                      setState(() {
                        widget.quest.isComplete = true;
                      });
                    },
                    child: const Text('완료'),
                  ),
          ),
        ],
      ),
    );
  }
}
