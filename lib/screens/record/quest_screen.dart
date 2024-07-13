import 'package:ego/models/quest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  final List<String> category = ['전체보기', '투두', '쓰기', '사진', '대화'];
  int _selectedIndex = 0;

  final List<Quest> questList = [
    Quest(
      category: '투두',
      title: 'Quest 1',
      date: '4월 26일',
      rate: 5,
    ),
    Quest(
      category: '투두',
      title: 'Quest 2',
      date: '3월 15일',
      rate: 3,
    ),
    Quest(
      category: '쓰기',
      title: 'Quest 3',
      date: '3월 15일',
      rate: 4,
    ),
    Quest(
      category: '사진',
      title: 'Quest 4',
      date: '3월 15일',
      rate: 2,
    ),
    Quest(
      category: '대화',
      title: 'Quest 5',
      date: '3월 15일',
      rate: 1,
    ),
  ];

  String _selectedYear = DateTime.now().year.toString();
  final List<String> _years =
      List.generate(1, (index) => (DateTime.now().year - index).toString());

  List<Quest> get filteredQuestList {
    if (category[_selectedIndex] == '전체보기') {
      return questList;
    } else {
      return questList
          .where((quest) => quest.category == category[_selectedIndex])
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _selectedYear,
                  items: _years
                      .map((year) => DropdownMenuItem(
                            value: year,
                            child: Text(year),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedYear = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height * 0.04,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) {
                bool isSelected = _selectedIndex == index;
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 10 : 23, top: 7),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                      child: Text(
                        category[index],
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          filteredQuestList.isEmpty
              ? Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      '아직 완료한 퀘스트가 없어요\n감정을 기록하고 퀘스트를 추천 받아보세요',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: filteredQuestList.length,
                    itemBuilder: (context, index) {
                      final quest = filteredQuestList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
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
                          // ListTile(
                          //   title: Text(quest.category),
                          // ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
