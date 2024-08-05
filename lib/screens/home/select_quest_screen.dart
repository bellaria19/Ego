import 'package:ego/models/quest.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:ego/utils/constants_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectQuestScreen extends StatefulWidget {
  const SelectQuestScreen({
    super.key,
    required this.keyword,
  });

  final String keyword;

  @override
  State<SelectQuestScreen> createState() => _SelectQuestScreenState();
}

class _SelectQuestScreenState extends State<SelectQuestScreen> {
  String? selectedQuest;

  @override
  Widget build(BuildContext context) {
    final List<Quest> quests = _getQuests(widget.keyword);

    return Scaffold(
      appBar: AppBar(
          //   actions: [
          //     IconButton(
          //       onPressed: () {
          //         Navigator.of(context).pushReplacement(MainScreen.route());
          //       },
          //       icon: const Icon(FontAwesomeIcons.xmark),
          //     ),
          //   ],
          ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  '키워드와 관련된 퀘스트\n추천을 받으시겠어요?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nanumGothicCoding(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: quests.map((quest) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedQuest = quest.title;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        height: MediaQuery.of(context).size.height / 3,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedQuest == quest.title
                                ? Colors.blue
                                : Colors.black,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  categoryToString[quest.category]!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            formSpacer,
                            Text(
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              quest.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black),
                        child: const Text(
                          '건너뛰기',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: selectedQuest != null
                            ? () {
                                // Handle quest selection
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainScreen()));
                                debugPrint('Selected Quest: $selectedQuest');
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: selectedQuest != null
                                ? Colors.black
                                : Colors.grey),
                        child: const Text('완료하기'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Quest> _getQuests(String keyword) {
    // For simplicity, we return hardcoded quests here.
    // In a real app, you might fetch this data from a server or database.
    return [
      Quest(
        category: QuestCategory.todo,
        title: 'Do something related to $keyword',
        date: DateTime.now(),
        isComplete: false,
      ),
      Quest(
        category: QuestCategory.write,
        title: 'Write about $keyword',
        date: DateTime.now(),
        isComplete: false,
      ),
      Quest(
        category: QuestCategory.picture,
        title: 'Take a picture of something that represents $keyword',
        date: DateTime.now(),
        isComplete: false,
      ),
    ];
  }
}
