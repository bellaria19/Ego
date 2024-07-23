import 'package:ego/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/profile.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const DetailScreen(),
    );
  }

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Profile userData = Profile(
    id: '0',
    username: 'Username',
    createdAt: DateTime.now(),
    gender: 'male',
    birthday: DateTime(2000, 12, 19),
  );

  TimeOfDay? selectedTime;
  bool questAlarm = false;
  bool emotionAlarm = false;
  int _selectedGender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
            // Handle back button press
          },
        ),
        title:
            const Text('나의 계정', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SetListTile(title: '닉네임 변경', onTap: () {}),
          SetListTile(
            title: '생년 월일 변경',
            subtitle: '0000년 00월 00일',
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
                        onDateTimeChanged: (value) {
                          print(value);
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
                          initialItem: _selectedGender,
                        ),
                        onSelectedItemChanged: (int selectedGender) {
                          setState(() {
                            _selectedGender = selectedGender;
                          });
                        },
                        children:
                            List.generate(genderOptions.length, (int index) {
                          return Center(
                              child: Text(genderOptions[index].label));
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

class SetListTile extends StatelessWidget {
  const SetListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        // style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: const TextStyle(color: Colors.grey),
            )
          : null,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}

class ReusableSwitchTile extends StatelessWidget {
  const ReusableSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}

class ListItem {
  final String value;
  final String label;

  ListItem({required this.value, required this.label});
}

List<ListItem> genderOptions = [
  ListItem(
    value: 'M',
    label: 'Male',
  ),
  ListItem(
    value: 'F',
    label: 'Female',
  ),
  ListItem(
    value: 'O',
    label: 'Other',
  ),
];
