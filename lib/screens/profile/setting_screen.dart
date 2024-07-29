import 'package:ego/main.dart';
import 'package:ego/utils/constants.dart';
import 'package:ego/widget/set_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

import '../../models/profile.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.userData});

  final Profile userData;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

Profile userData = Profile(
  id: '0',
  username: 'Username',
  createdAt: DateTime.now(),
  gender: 'male',
  birthday: DateTime(2000, 12, 19),
);

class _DetailScreenState extends State<DetailScreen> {
  TimeOfDay? selectedTime;
  bool questAlarm = false;
  bool emotionAlarm = false;

  void updateUsername() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          TextEditingController controller = TextEditingController();
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '새로운 닉네임을 입력해주세요',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xffE1E3EF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      maxLength: 10,
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '새로운 닉네임',
                        counterText: '',
                        suffixIcon: IconButton(
                          onPressed: controller.clear,
                          icon: const Icon(FontAwesomeIcons.xmark),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  '언제든지 다시 바꿀 수 있어요.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xff9B9B9B),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userData.setUsername = controller.text;
                      print(userData.getUsername);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black),
                  child: const Text('완료하기'),
                ),
                formSpacer,
              ],
            ),
          );
        });
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     TextEditingController controller = TextEditingController();
    //     return
    //       AlertDialog(
    //       title: const Text('닉네임 변경'),
    //       content: TextField(
    //         controller: controller,
    //         decoration: const InputDecoration(
    //           hintText: 'Enter new username',
    //         ),
    //       ),
    //       actions: <Widget>[
    //         TextButton(
    //           child: const Text('취소'),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //         TextButton(
    //           child: const Text('확인'),
    //           onPressed: () {
    //             setState(() {
    //               userData.setUsername = controller.text;
    //               print(userData.getUsername);
    //             });
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title:
            const Text('나의 계정', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SetListTile(title: '닉네임 변경', onTap: updateUsername),
          SetListTile(
            title: '생년 월일 변경',
            subtitle: DateFormat('yyyy년 MM월 dd일').format(userData.getBirthday),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Center(
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: userData.birthday,
                        onDateTimeChanged: (DateTime newBirthday) {
                          setState(() {
                            userData.setBirthday = newBirthday;
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SetListTile(
            title: '성별 변경',
            subtitle: userData.getGender,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Center(
                      child: CupertinoPicker(
                        itemExtent: 32,
                        scrollController: FixedExtentScrollController(
                          initialItem: 0,
                        ),
                        onSelectedItemChanged: (int selectedGender) {
                          setState(() {
                            userData.setGender = gender[selectedGender];
                          });
                        },
                        children: List.generate(gender.length, (int index) {
                          return Center(child: Text(gender[index]));
                        }),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const Divider(
            height: 15,
          ),
          SetListTile(
            title: '오픈 라이선스',
            onTap: () {},
          ),
          SetListTile(
            title: '개인정보처리방침',
            onTap: () {},
          ),
          SetListTile(
            title: '이용약관',
            onTap: () {},
          ),
          const Divider(
            height: 15,
          ),
          ListTile(
            title: const Text('로그아웃',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('로그아웃'),
                  content: const Text('정말로 로그아웃 하시겠습니까?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('취소'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('확인'),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        GoogleSignIn().signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const MyApp()),
                            (Route<dynamic> route) => false);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text('계정탈퇴',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('계정 탈퇴'),
                  content: const Text('정말로 계정을 삭제하시겠습니까?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('취소'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(child: const Text('확인'), onPressed: () {}),
                  ],
                ),
              );
            },
          ),
          formSpacer,
        ],
      ),
    );
  }

  String formatTimeOfDay(BuildContext context, TimeOfDay timeOfDay) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(timeOfDay,
        alwaysUse24HourFormat: true);
  }
}

List gender = [
  'Male',
  'Female',
  'Other',
];
