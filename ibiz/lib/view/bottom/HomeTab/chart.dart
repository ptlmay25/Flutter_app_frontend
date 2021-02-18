import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ibiz/size_config.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: LineChart(LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) => TextStyle(
                color: Color(0xff68737d),
                fontWeight: FontWeight.normal,
                fontSize: 16 * SizeConfig.heightMultiplier),
            getTitles: (value) {
              switch (value.toInt()) {
                case 2:
                  return '3M';
                case 5:
                  return '6M';
                case 8:
                  return '1Y';
                case 11:
                  return '3Y';
                case 14:
                  return 'ALL';
              }
              return '';
            },
            //margin: 8,
          ),
          leftTitles: SideTitles(showTitles: false)
          // leftTitles: SideTitles(
          //   showTitles: true,
          //   getTextStyles: (value) => const TextStyle(
          //     color: Color(0xff67727d),
          //     fontWeight: FontWeight.bold,
          //     fontSize: 15,
          //   ),
          //   getTitles: (value) {
          //     switch (value.toInt()) {
          //       case 1:
          //         return '10k';
          //       case 3:
          //         return '30k';
          //       case 5:
          //         return '50k';
          //     }
          //     return '';
          //   },
          //   reservedSize: 28,
          //   margin: 12,
          // ),
          ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 0,
      maxX: 14,
      minY: 0,
      maxY: 1500,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 0),
            FlSpot(2.8, 200),
            FlSpot(5.6, 600),
            FlSpot(8.4, 600),
            FlSpot(11.2, 1000),
            FlSpot(14, 1000),
          ],
          isCurved: false,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    )));
  }
}
