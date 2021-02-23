import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ibiz/models/token.dart';
import 'package:ibiz/size_config.dart';
import 'package:ibiz/view/bottom/HomeTab/tokenlist.dart';

class Chart extends StatefulWidget {
  final List<Token> tokenList;
  Chart({this.tokenList});
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
    int n = widget.tokenList.length;
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
                case 4:
                  return '3M';
                case 8:
                  return '6M';
                case 12:
                  return '1Y';
                case 16:
                  return '3Y';
                case 20:
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
      maxX: 20,
      minY: 0,
      maxY: widget.tokenList[n-1].tokenPrice,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, widget.tokenList[0].tokenPrice),
            FlSpot(2, widget.tokenList[n~/10].tokenPrice),
            FlSpot(4, widget.tokenList[2*n~/10].tokenPrice),
            FlSpot(6, widget.tokenList[3*n~/10].tokenPrice),
            FlSpot(8, widget.tokenList[4*n~/10].tokenPrice),
            FlSpot(10, widget.tokenList[5*n~/10].tokenPrice),
            FlSpot(12, widget.tokenList[6*n~/10].tokenPrice),
            FlSpot(14, widget.tokenList[7*n~/10].tokenPrice),
            FlSpot(16, widget.tokenList[8*n~/10].tokenPrice),
            FlSpot(18, widget.tokenList[9*n~/10].tokenPrice),
            FlSpot(20, widget.tokenList[n-1].tokenPrice),
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
