import 'package:ego/models/emotion.dart';
import 'package:ego/models/quest.dart';
import 'package:ego/screens/profile/setting_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../models/profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Emotion> dummyEmotions = generateSampleEmotions(10);
  List<Quest> dummyQuests = generateSampleQuests(10);
  Profile userData = Profile(
    id: '0',
    username: 'Username',
    createdAt: DateTime(2024, 7, 1),
    gender: 'male',
    birthday: DateTime(2000, 12, 19),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            formSpacer,
            Container(
              padding: formPadding,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox.fromSize(
                        size: const Size(100, 100), // button width and height
                        child: Image.asset(
                          'assets/profile.jpg',
                          fit: BoxFit.cover,
                        )),
                  ),
                  formSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userData.username,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(
                        DateFormat('yyyy년 MM월 dd일')
                            .format(userData.createdAt)
                            .toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.of(context).push(DetailScreen.route());
                      // Add your navigation logic here
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RecordCard(
                        type: RecordType.emotion,
                        count: dummyEmotions.length,
                      ),
                      formSpacer,
                      RecordCard(
                        type: RecordType.quest,
                        count: dummyQuests.length,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          // Add your logic for when the card is tapped
                        },
                        child: const Center(
                          child: Column(
                            children: [
                              Icon(FontAwesomeIcons.solidEnvelope),
                              Text('건의함'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Add your logic for when the card is tapped
                        },
                        child: const Center(
                          child: Column(
                            children: [
                              Icon(FontAwesomeIcons.solidStar),
                              Text('이벤트'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Add your logic for when the card is tapped
                        },
                        child: const Center(
                          child: Column(
                            children: [
                              Icon(FontAwesomeIcons.hammer),
                              Text('준비중'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
