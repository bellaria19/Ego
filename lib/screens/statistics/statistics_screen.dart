import 'package:ego/models/chartData.dart';
import 'package:ego/screens/statistics/stat_card.dart';
import 'package:ego/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'annual_report_screen.dart';
import 'monthly_report_screen.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

// List<String> emotionStages = [
//   "매우 좋음 (Ecstatic)",
//   "좋음 (Happy)",
//   "보통 (Neutral)",
//   "나쁨 (Unhappy)",
//   "매우 나쁨 (Miserable)"
// ];

class _StatisticsScreenState extends State<StatisticsScreen> {
  // Sample data for demonstration
  final List<ChartData> chartData = [
    ChartData('Ecstatic', 10),
    ChartData('Happy', 30),
    ChartData('Neutral', 30),
    ChartData('Sad', 20),
    ChartData('Angry', 10),
  ];

  // Sample icons, replace with actual icons for different emotions
  final Map<String, IconData> emotionIcon = {
    'Ecstatic': FontAwesomeIcons.faceLaugh,
    'Happy': FontAwesomeIcons.faceSmile,
    'Neutral': FontAwesomeIcons.faceMeh,
    'Sad': FontAwesomeIcons.faceFrown,
    'Angry': FontAwesomeIcons.faceAngry,
  };

  final List<Map<String, dynamic>> selectedEmotion = [
    {'emotion': 'Happy'},
    {'emotion': 'Sad'},
    {'emotion': 'Neutral'},
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy년 M월').format(now);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/history.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                formattedDate,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumSquareRound',
                ),
              ),
              const Divider(),
              formSpacer,
              Expanded(
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MonthlyReportScreen(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: StatCard(
                            child: Center(
                              child: Text(
                                '월간 리포트\n보러가기',
                                style: TextStyle(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AnnualReportScreen(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: StatCard(
                            child: Center(
                              child: Text(
                                '연간 리포트\n보러가기',
                                style: TextStyle(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StatCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              formSpacer,
                              const Text(
                                '많이 기록한 감정 순위',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              formSpacer,
                              Expanded(
                                child: ListView.builder(
                                  itemCount: selectedEmotion.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      '${index + 1}. ${selectedEmotion[index]['emotion']}',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'NanumSquareRound',
                                      ),
                                      textAlign: TextAlign.center,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StatCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '총 기록한 감정 개수',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '3개',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NanumSquareRound',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StatCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '총 완료한 퀘스트 개수',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '7개',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NanumSquareRound',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StatCard(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  '전체 기분분포 그래프',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'NanumSquareRound',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: SfCircularChart(
                                        series: <CircularSeries>[
                                          DoughnutSeries<ChartData, String>(
                                            animationDuration: 0,
                                            dataSource: chartData,
                                            xValueMapper: (ChartData data, _) =>
                                                data.x,
                                            yValueMapper: (ChartData data, _) =>
                                                data.y,
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: chartData.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(emotionIcon[
                                                    chartData[index].x]),
                                                Text(
                                                  ' : ${chartData[index].y.toStringAsFixed(0)}%',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'NanumSquareRound',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
