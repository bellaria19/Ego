import 'package:ego/models/chartdata.dart';
import 'package:ego/screens/statistics/annual_report_screen.dart';
import 'package:ego/screens/statistics/monthly_report_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});
  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final List<ChartData> chartData = [
    ChartData('1번', 20),
    ChartData('2번', 20),
    ChartData('3번', 20),
    ChartData('4번', 20),
    ChartData('5번', 20),
  ];

  // List<String> emotionStages = [
//   "매우 좋음 (Ecstatic)",
//   "좋음 (Happy)",
//   "보통 (Neutral)",
//   "나쁨 (Unhappy)",
//   "매우 나쁨 (Miserable)"
// ];

  List selectedEmotion = [
    {'emotion': '기쁨', 'count': 3},
    {'emotion': '슬픔', 'count': 2},
    {'emotion': '분노', 'count': 1},
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
          child: Column(children: [
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
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.black, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            '월간 리포트\n보러가기',
                            style: TextStyle(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
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
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.black, width: 2),
                        ),
                        child: const Center(
                          child: Text(
                            '연간 리포트\n보러가기',
                            style: TextStyle(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
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
                              itemCount: 3,
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
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
                      borderOnForeground: true,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black, width: 2),
                      ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      // padding: const EdgeInsets.only(top: 10),
                                      itemCount: chartData.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            '${chartData[index].x} : ${chartData[index].y.toStringAsFixed(0)}%',
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                            // textAlign: TextAlign.start,
                                          ),
                                        );
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
