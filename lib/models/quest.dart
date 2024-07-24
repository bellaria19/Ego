import 'dart:math';

enum QuestCategory {
  todo,
  write,
  picture,
  chat,
}

class Quest {
  final QuestCategory category;
  final String title;
  final DateTime date;
  bool isComplete;
  final int? rate;

  Quest({
    required this.category,
    required this.title,
    required this.date,
    required this.isComplete,
    this.rate,
  });
}

// 임의의 데이터 생성 함수
List<Quest> generateSampleQuests(int count) {
  List<Quest> quests = [];
  Random random = Random();

  List<String> titles = [
    'Complete homework',
    'Write a blog post',
    'Take a photo of nature',
    'Chat with a friend',
    'Finish project',
    'Draft a short story',
    'Capture a sunset',
    'Discuss a book',
  ];

  for (int i = 0; i < count; i++) {
    QuestCategory category =
        QuestCategory.values[random.nextInt(QuestCategory.values.length)];
    String title = titles[random.nextInt(titles.length)];
    DateTime date =
        DateTime.now().subtract(Duration(days: random.nextInt(365)));
    int rate = random.nextInt(6); // 0부터 5까지의 랜덤 숫자

    quests.add(Quest(
      category: category,
      title: title,
      date: date,
      isComplete: rate == 0 ? false : true,
      rate: rate,
    ));
  }

  return quests;
}
