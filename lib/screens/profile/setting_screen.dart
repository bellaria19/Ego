import 'package:ego/screens/profile/reusable_switch_tile.dart';
import 'package:ego/screens/profile/set_list_tile.dart';
import 'package:ego/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: const Text('닉네임 변경'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter new username',
            ),
          ),
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
                setState(() {
                  userData.setUsername = controller.text;
                  print(userData.getUsername);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          ReusableSwitchTile(
            title: '퀘스트 알림',
            value: questAlarm,
            onChanged: (bool value) {
              setState(() {
                questAlarm = value;
              });
            },
          ),
          ReusableSwitchTile(
            title: '감정 알림',
            value: emotionAlarm,
            onChanged: (bool value) {
              setState(() {
                emotionAlarm = value;
              });
            },
          ),
          SetListTile(
            title: '알림 시간',
            subtitle: selectedTime != null
                ? formatTimeOfDay(context, selectedTime!)
                : '',
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((time) {
                if (time != null) {
                  setState(() {
                    selectedTime = time;
                  });
                }
              });
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
              Supabase.instance.client.auth.signOut();
              // TODO: Implement logout
            },
          ),
          ListTile(
            title: const Text('계정탈퇴',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            onTap: () {
              // TODO: Implement delete account
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
