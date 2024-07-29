import 'package:ego/models/quest.dart';

const List<String> category = ['전체', '투두', '쓰기', '사진', '대화'];

const Map<String, QuestCategory> categoryMap = {
  '투두': QuestCategory.todo,
  '쓰기': QuestCategory.write,
  '사진': QuestCategory.picture,
  '대화': QuestCategory.chat
};

const Map<QuestCategory, String> categoryToString = {
  QuestCategory.todo: '투두',
  QuestCategory.write: '쓰기',
  QuestCategory.picture: '사진',
  QuestCategory.chat: '대화',
};
