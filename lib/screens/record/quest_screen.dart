import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ego/models/quest.dart';
import 'package:ego/utils/constants.dart';
import 'package:ego/utils/constants_data.dart';
import 'package:ego/widget/quest_card.dart';
import 'package:flutter/material.dart';

import 'empty_quest.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  int _selectedIndex = 0;
  List<Quest> questList = [];
  Map<Quest, String> questMap = {};

  @override
  void initState() {
    super.initState();
    // Generate and sort emotions initially
    // questList = generateSampleQuests(10);
    // sortEmotionsByDate();
  }

  // void sortEmotionsByDate() {
  //   questList.sort((a, b) => b.date.compareTo(a.date));
  // }

  String _selectedYear = DateTime.now().year.toString();
  final List<String> _years =
      List.generate(1, (index) => (DateTime.now().year - index).toString());

  List<Quest> get filteredQuestList {
    if (category[_selectedIndex] == '전체') {
      return questList;
    } else {
      return questList
          .where((quest) =>
              quest.category == categoryMap[category[_selectedIndex]])
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
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
        formSpacer,
        StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getQuestsStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List questsList = snapshot.data!.docs;
              List<Quest> fetchedQuests = questsList.map((doc) {
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                return Quest.fromMap(data);
              }).toList();
              List id = questsList.map((doc) {
                // debugPrint(doc.id);
                return doc.id;
              }).toList();

              questMap = {
                for (var quest in fetchedQuests)
                  quest: id[fetchedQuests.indexOf(quest)]
              };
              questList = fetchedQuests;

              // for (var quest in questList) {
              //   debugPrint(quest.toJson().toString());
              // }
              return filteredQuestList.isEmpty
                  ? const EmptyQuest()
                  : Expanded(
                      child: ListView.builder(
                        // shrinkWrap: true,
                        itemCount: filteredQuestList.length,
                        itemBuilder: (context, index) {
                          final quest = filteredQuestList[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: QuestCard(
                              quest: quest,
                              docId: questMap[quest] ?? '',
                            ),
                          );
                        },
                      ),
                    );
            } else {
              return const EmptyQuest();
            }
          },
        ),
      ],
    );
  }
}
