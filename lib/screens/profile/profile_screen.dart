import 'package:ego/models/emotion.dart';
import 'package:ego/models/quest.dart';
import 'package:ego/models/user_model.dart';
import 'package:ego/provider/user_provider.dart';
import 'package:ego/screens/profile/setting_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:ego/widget/record_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserModelProvider _provider = UserModelProvider();
  late UserModel user;
  List<Emotion> dummyEmotions = generateSampleEmotions(10);
  List<Quest> dummyQuests = generateSampleQuests(10);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = _provider.user ?? _provider.defaultUser;
    print(user.username);
  }

  // Future<UserModel?> getUserData() async {
  //   try {
  //     DocumentSnapshot<Map<String, dynamic>> doc =
  //         await db.collection('Users').doc(firebase.currentUser?.uid).get();
  //     if (doc.exists) {
  //       _user = UserModel.fromMap(doc.data()!);
  //       debugPrint(_user.toString());
  //     } else {
  //       debugPrint('not exists ${doc.toString()}');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  //   return null;
  // }

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
                      Text(user.username,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(
                        DateFormat('yyyy년 MM월 dd일')
                            .format(DateTime.now())
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScreen(),
                        ),
                      );
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
