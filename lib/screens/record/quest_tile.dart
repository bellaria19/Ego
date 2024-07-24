import 'package:ego/models/quest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

const Map<QuestCategory, String> categoryMap = {
  QuestCategory.todo: '투두',
  QuestCategory.write: '쓰기',
  QuestCategory.picture: '사진',
  QuestCategory.chat: '대화',
};

class QuestTile extends StatefulWidget {
  const QuestTile({
    super.key,
    required this.quest,
  });

  final Quest quest;

  @override
  State<QuestTile> createState() => _QuestTileState();
}

class _QuestTileState extends State<QuestTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(),
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
                  categoryMap[widget.quest.category] ?? 'Unknown',
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
                      print(rating);
                    },
                  )
                : TextButton(
                    onPressed: () {
                      setState(() {
                        widget.quest.isComplete = true;
                      });
                    },
                    child: const Text('완료')),
          ),
        ],
      ),
    );
  }
}
