import 'package:ego/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DayReward extends StatelessWidget {
  const DayReward({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Icon(
                  //     FontAwesomeIcons.bone),
                  const Text(
                    '오늘의 보상',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(FontAwesomeIcons.xmark),
                  ),
                ],
              ),
              const Divider(),
              // Text('매일 0시 초기화'),
              formSpacer,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('일일 퀘스트'),
                  Text('0/1'),
                ],
              ),
              formSpacer,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('퀘스트 명'),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              formSpacer,
              const Row(
                children: [
                  Text('출석 보너스'),
                  SizedBox(width: 8),
                  Text('+100'),
                ],
              ),
              formSpacer,
            ],
          )),
      // title: const Text('Popup'),
    );
  }
}
