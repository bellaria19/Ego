import 'package:ego/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          _buildListItem(context, '닉네임 변경', onTap: () {}),
          _buildListItem(context, '생년월일 변경', subtitle: '0000년 00월 00일',
              onTap: () {
            showModalBottomSheet<void>(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 300,
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
                });
          }),
          _buildListItem(context, '성별 변경', onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => Container());
          }),
          // _buildListItem(context, '멤버십 보기', onTap: () {}),

          const Divider(
            height: 20,
          ),

          _buildListItem(context, '오픈 라이선스', onTap: () {}),
          _buildListItem(context, '개인정보처리방침', onTap: () {}),
          _buildListItem(context, '이용약관', onTap: () {}),
          const Divider(
            height: 20,
          ),
          ListTile(
            title: const Text('로그아웃',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            onTap: () {
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

  Widget _buildListItem(BuildContext context, String title,
      {String? subtitle, void Function()? onTap}) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: subtitle != null
          ? Text(subtitle, style: const TextStyle(color: Colors.grey))
          : null,
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
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
