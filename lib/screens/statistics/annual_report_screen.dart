import 'package:flutter/material.dart';

class AnnualReportScreen extends StatelessWidget {
  const AnnualReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '연간 리포트',
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: Column(
            children: [
              Text('연간 리포트 화면입니다.'),
            ],
          ),
        ),
      ),
    );
  }
}
