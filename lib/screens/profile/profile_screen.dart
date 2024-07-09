import 'package:ego/screens/profile/detail_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../models/profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile userData = Profile(
    id: '0',
    username: 'Username',
    createdAt: DateTime.now(),
    gender: 'male',
    birthday: DateTime(2000, 12, 19),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: formPadding,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: SizedBox.fromSize(
                            size: const Size(50, 50), // button width and height
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
                          Text(userData.createdAt.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
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
                const Divider(),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      Card(
                        child: Center(
                          child: Text('기록한 감정\n3', textAlign: TextAlign.center),
                        ),
                      ),
                      Card(
                        child: Center(
                          child:
                              Text('완료한 퀘스트\n3', textAlign: TextAlign.center),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Add your logic for when the card is tapped
                        },
                        child: Card(
                          child: Center(
                            child: Text('건의함', textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Add your logic for when the card is tapped
                        },
                        child: Card(
                          child: Center(
                            child: Text('제작소', textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
