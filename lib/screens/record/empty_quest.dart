import 'package:flutter/material.dart';

class EmptyQuest extends StatelessWidget {
  const EmptyQuest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          '아직 완료한 퀘스트가 없어요\n감정을 기록하고 퀘스트를 추천 받아보세요',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
