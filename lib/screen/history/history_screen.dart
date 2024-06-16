import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/history.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Expanded(
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: const [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Card(
                    child: Column(
                      children: [
                        Text('월간 리포트 보러가기'),
                      ],
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Card(
                    child: Column(
                      children: [
                        Text('연간 리포트 보러가기'),
                      ],
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Card(
                    child: Column(
                      children: [
                        Text('많이 기록한 감정 순위'),
                      ],
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Card(
                    borderOnForeground: true,
                    child: Column(
                      children: [
                        Text('3개'),
                        Text('총 기록한 감정 개수'),
                      ],
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Card(
                    child: Column(
                      children: [
                        Text('3개'),
                        Text('총 완료한 테스트 개수'),
                      ],
                    ),
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 2,
                  child: Card(
                    child: Column(
                      children: [
                        Text('기분 분포 그래프'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
