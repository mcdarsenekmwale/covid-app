
import 'package:covid_app/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CovidLineChart extends StatefulWidget {
  @override
  _CovidLineChartState createState() => _CovidLineChartState();
}

class _CovidLineChartState extends State<CovidLineChart> {
  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: AppColor.appBgColor.withOpacity(0.5)
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.07, right: 16.0, left: 6.0),
                    child: LineChart(
                       sampleData1() ,
                      swapAnimationDuration: const Duration(milliseconds: 250),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildLegend(title: 'Active', color: AppColor.yellowCardColor),
                    buildLegend(title: 'Recovered', color: AppColor.greenCardColor),
                    buildLegend(title: 'Deaths', color: AppColor.redCardColor),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

 Widget buildLegend({String title, Color color}){
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 4.0),
            padding: EdgeInsets.all(4.0),
            height: 8,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          Text(title,
            style: TextStyle(
                color: AppColor.appTextMutedColor2,
                fontWeight: FontWeight.w500,
              fontSize: 10.0
            ),)
        ],
      ),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.1),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles:( v)=> TextStyle(
            color: AppColor.appTextMutedColor2,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Mar 08';
              case 3:
                return 'Mar 15';
              case 5:
                return 'Mar 22';
              case 7:
                return 'Mar 29';
              case 9:
                return 'Apr 05';
              case 11:
                return 'Apr 12';
              case 13:
                return 'Apr 19';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles:(v)=> TextStyle(
            color: AppColor.appTextMutedColor2,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '20k';
              case 2:
                return '50k';
              case 3:
                return '100k';
              case 4:
                return '150k';
              case 5:
                return '200k';
              case 6:
                return '250k';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border:  Border(
          bottom: BorderSide(
            color: Color(0xff4e4965).withOpacity(0.4),
            width: 1,
          ),
          left: BorderSide(
            color: Color(0xff4e4965).withOpacity(0.4),
            width: 1,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 14,
      maxY: 7,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 0.5),
        FlSpot(3, 1.3),
        FlSpot(5, 1.6),
        FlSpot(7, 2.4),
        FlSpot(8, 2.8),
        FlSpot(10, 3.1),
        FlSpot(12, 3.5),
        FlSpot(13, 4.8),
      ],
      isCurved: true,
      colors: [
        AppColor.greenCardColor,
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 0.5),
        FlSpot(3, 1.3),
        FlSpot(7, 1.4),
        FlSpot(8, 1.5),
        FlSpot(10, 1.8),
        FlSpot(12, 2.4),
        FlSpot(13, 2.5),
      ],
      isCurved: true,
      colors: [
        AppColor.redCardColor,
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(1, 0.5),
        FlSpot(2, 1.1),
        FlSpot(3, 1.5),
        FlSpot(4, 1.8),
        FlSpot(5, 2.8),
        FlSpot(6, 3),
        FlSpot(7, 3.2),
        FlSpot(8, 3.4),
        FlSpot(9, 3.8),
        FlSpot(10, 5.1),
        FlSpot(13, 5),
      ],
      isCurved: true,
      colors:  [
       AppColor.yellowCardColor,
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }

}
