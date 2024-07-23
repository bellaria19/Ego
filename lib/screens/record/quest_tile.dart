import 'package:ego/models/quest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class QuestTile extends StatelessWidget {
  const QuestTile({
    super.key,
    required this.quest,
  });

  final Quest quest;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              quest.category.toString(),
            ),
          ),
          ListTile(
            title: Text(quest.title),
            subtitle: Text(quest.date),
            trailing: RatingBar.builder(
              initialRating: quest.rate.toDouble(),
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
            ),
          ),
        ],
      ),
    );
  }
}
