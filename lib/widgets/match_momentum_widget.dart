import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:threescorersassessment/constants/asset_path.dart';
import 'package:threescorersassessment/data_model/match_momentum.dart';

class MatchMomentumChart extends StatefulWidget {
  final List<MatchMomentumModel> momentumData;

  const MatchMomentumChart({super.key, required this.momentumData});

  @override
  State<MatchMomentumChart> createState() => _MatchMomentumChartState();
}

class _MatchMomentumChartState extends State<MatchMomentumChart> {
  static const double barWidth = 22;
  static const shadowOpacity = 0.2;
  int touchedIndex = -1;

  BarChartGroupData _generateGroup(int x, double possession) {
    final isTouched = touchedIndex == x;
    final isPositive = possession >= 0;

    return BarChartGroupData(
      x: x,
      groupVertically: true,
      showingTooltipIndicators: isTouched ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: possession.abs(),
          width: barWidth,
          borderRadius: BorderRadius.circular(6),
          color: isPositive
              ? Colors.green.withOpacity(0.7)
              : Colors.red.withOpacity(0.7),
          borderSide: BorderSide(
            color: Colors.white,
            width: isTouched ? 2 : 0,
          ),
        ),
        // Shadow rod
        BarChartRodData(
          toY: possession.abs(),
          width: barWidth,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              possession.abs(),
              (isPositive ? Colors.green : Colors.red)
                  .withOpacity(isTouched ? shadowOpacity * 2 : shadowOpacity),
              const BorderSide(color: Colors.transparent),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.teal,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: const SizedBox(
            width: 500,
            child: Text(
              'Live Match Momentum',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceEvenly,
                      maxY: 100,
                      minY: 0,
                      groupsSpace: 12,
                      barTouchData: BarTouchData(
                        handleBuiltInTouches: true,
                        touchCallback: (FlTouchEvent event, barTouchResponse) {
                          if (!event.isInterestedForInteractions ||
                              barTouchResponse == null ||
                              barTouchResponse.spot == null) {
                            setState(() {
                              touchedIndex = -1;
                            });
                            return;
                          }
                          setState(() {
                            touchedIndex =
                                barTouchResponse.spot!.touchedBarGroupIndex;
                          });
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              final teamData =
                                  widget.momentumData[value.toInt()];
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      teamData.teamName == 'Home Team'
                                          ? AssetsPath.barcelona
                                          : AssetsPath.girona,
                                      height: 20,
                                      width: 20,
                                    )
                                  ],
                                ),
                              );
                            },
                            reservedSize: 30,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 20,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              return Text('${value.toInt()}%');
                            },
                            reservedSize: 40,
                          ),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        checkToShowHorizontalLine: (value) => value % 20 == 0,
                      ),
                      borderData: FlBorderData(show: false),
                      barGroups: widget.momentumData.map((data) {
                        return _generateGroup(
                          widget.momentumData.indexOf(data),
                          data.possession,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
