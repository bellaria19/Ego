import 'package:flutter/material.dart';

class EmptyEmotion extends StatelessWidget {
  const EmptyEmotion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          '아직 기록한 감정이 없어요\n감정을 기록하고 퀘스트를 추천 받아보세요',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
