import 'package:ego/models/chartdata.dart';
import 'package:ego/screens/history/annual_report_screen.dart';
import 'package:ego/screens/history/monthly_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    // Get current date and format
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy년 M월').format(now);

    final List<ChartData> chartData = [
      ChartData('first', 20),
      ChartData('second', 20),
      ChartData('third', 20),
      ChartData('fourth', 20),
      ChartData('fifth', 20),
    ];

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
                  fontFamily: 'NanumSquareRound'),
            ),
            const Divider(),
            Expanded(
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 5,
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
                      child: const Card(
                        child: Center(
                          child: Text('월간 리포트'),
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
                      child: const Card(
                        child: Center(
                          child: Text('연간 리포트 보러가기'),
                        ),
                      ),
                    ),
                  ),
                  const StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: Card(
                      child: Column(
                        children: [
                          Text('많이 기록한 감정 순위'),
                          Text('1. 기쁨'),
                          Text('2. 슬픔'),
                          Text('3. 분노'),
                        ],
                      ),
                    ),
                  ),
                  const StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Card(
                      borderOnForeground: true,
                      child: Column(
                        children: [
                          Text('총 기록한 감정 개수'),
                          Text('3개'),
                        ],
                      ),
                    ),
                  ),
                  const StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Card(
                      child: Column(
                        children: [
                          Text('총 완료한 테스트 개수'),
                          Text('3개'),
                        ],
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 2,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('기분 분포'),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SfCircularChart(
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('First'),
                                    Text('Second'),
                                    Text('Third'),
                                    Text('Fourth'),
                                    Text('Fifth'),
                                  ],
                                )
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
