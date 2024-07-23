import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum RecordType {
  emotion,
  quest,
}

class RecordCard extends StatelessWidget {
  const RecordCard({
    super.key,
    required this.count,
    required this.type,
  });

  final RecordType type;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        // width: MediaQuery.of(context).size.width / width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(FontAwesomeIcons.trophy),
            _cardText(),
          ],
        ),
      ),
    );
  }

  Widget _cardText() {
    if (type == RecordType.emotion) {
      return Text(
        '기록한 감정 $count',
        style: const TextStyle(fontSize: 20),
      );
    } else if (type == RecordType.quest) {
      return Text(
        '완료한 퀘스트 $count',
        style: const TextStyle(fontSize: 20),
      );
    } else {
      return Container();
    }
  }
}
