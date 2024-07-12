import 'package:ego/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeSetScreen extends StatefulWidget {
  const HomeSetScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const HomeSetScreen());
  }

  @override
  State<HomeSetScreen> createState() => _HomeSetScreenState();
}

class _HomeSetScreenState extends State<HomeSetScreen> {
  TimeOfDay? selectedTime;
  bool questAlarm = false;
  bool emotionAlarm = false;
  bool backgroundMusic = false;
  bool darkMode = false;

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
        title: const Text('설정', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(children: [
        const ListTile(
          title: Text('알림', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SwitchListTile(
          title: const Text('퀘스트 알림'),
          value: questAlarm,
          onChanged: (bool value) {
            setState(() {
              questAlarm = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('감정 알림'),
          value: emotionAlarm,
          onChanged: (bool value) {
            setState(() {
              emotionAlarm = value;
            });
          },
        ),
        ListTile(
          title: const Text('알림 시간'),
          subtitle: Text(selectedTime != null
              ? formatTimeOfDay(context, selectedTime!)
              : ''),
          trailing: TextButton(
            onPressed: () {
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
            child: const Text('알림 시간 설정'),
          ),
          onTap: () {
            // Handle onTap event
          },
        ),
        formSpacer,
        const ListTile(
          title: Text('환경', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SwitchListTile(
          title: const Text('배경음악'),
          value: backgroundMusic,
          onChanged: (value) {
            setState(() {
              backgroundMusic = value;
            });
          },
        ),
        // SwitchListTile(
        //   title: const Text('진동'),
        //   value: ,
        //   onChanged: (value) {},
        // ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: darkMode,
          onChanged: (value) {
            setState(() {
              darkMode = value;
            });
          },
        ),
      ]),
    );
  }

  String formatTimeOfDay(BuildContext context, TimeOfDay timeOfDay) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(timeOfDay,
        alwaysUse24HourFormat: true);
  }
}
