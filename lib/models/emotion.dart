import 'dart:math';

enum EmotionType {
  ecstatic,
  happy,
  neutral,
  unhappy,
  miserable,
}

class Emotion {
  final String date;
  final EmotionType emotion;
  final String keyword;
  final String memo;

  Emotion({
    required this.date,
    required this.emotion,
    required this.keyword,
    required this.memo,
  });
}

// TODO 더미 데이터 생성용
// 임의의 데이터 생성 함수
List<Emotion> generateSampleEmotions(int count) {
  List<Emotion> emotions = [];
  Random random = Random();

  List<String> keywords = [
    'work',
    'family',
    'friends',
    'health',
    'hobby',
    'study'
  ];
  List<String> memos = [
    'Had a great day at work',
    'Spent time with family',
    'Met friends and had fun',
    'Feeling under the weather',
    'Enjoyed my hobby',
    'Studied a lot today',
    'Had a rough day',
    'Feeling motivated',
    'Need some rest',
    'Accomplished my goals',
    '',
  ];

  for (int i = 0; i < count; i++) {
    String date = DateTime.now()
        .subtract(Duration(days: random.nextInt(365)))
        .toIso8601String()
        .split('T')
        .first;
    EmotionType emotion =
        EmotionType.values[random.nextInt(EmotionType.values.length)];
    String keyword = keywords[random.nextInt(keywords.length)];
    String memo = memos[random.nextInt(memos.length)];

    emotions.add(Emotion(
      date: date,
      emotion: emotion,
      keyword: keyword,
      memo: memo,
    ));
  }

  return emotions;
}
