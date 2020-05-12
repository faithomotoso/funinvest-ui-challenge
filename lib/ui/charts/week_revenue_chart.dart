import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:funinvest_ui_challenge/business_logic/app/app.dart';
import 'package:funinvest_ui_challenge/utils/dimens.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';
import 'package:funinvest_ui_challenge/ui/painter/dashed_line_circle.dart';

class WeekRevenueChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeekRevenueChart();
  }
}

class _WeekRevenueChart extends State<WeekRevenueChart> {
  App app = App();
  Dimens dimens;
  List<String> _options = ["week"];
  String _selectedOption = "week";

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      width: 500,
      child: Column(
        children: <Widget>[
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: darkPurpleColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))
            ),
            width: dimens.width,
            padding: EdgeInsets.only(top: 18, bottom: 5),
            child: LineChart(lineChartData()),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: 18,
                width: constraints.maxWidth,
                padding: EdgeInsets.symmetric(vertical: 1),
                color: darkPurpleColor,
                child: CustomPaint(
                  painter: DashedLineCircle(),
                ),
              );
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
              color: darkPurpleColor
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          app.companyWeekRevenueData.first.logoPath
                        ),
                        radius: 30,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(
                        width: 10
                      ),
                      Center(
                        child: Text(app.companyWeekRevenueData.first.companyName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isDense: true,
                      items: _options.map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(
                              color: lightPurpleColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      )).toList(),
                      onChanged: (v) {
                        setState(() {
                          _selectedOption = v;
                        });
                      },
                      value: _selectedOption,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<FlSpot> dataSpots() {
    // return FLSpots with data from app.companyWeekRevenueData
    List<FlSpot> spotData = [];
    // beginning point
    spotData.add(FlSpot(0, 400));

    // only one entry
    app.companyWeekRevenueData.first.weekRevenueData
        .asMap()
        .forEach((index, data) {
      spotData.add(FlSpot((index.toDouble() + 1) * 2, data.revenue));
    });

    // end
    spotData.add(FlSpot((spotData.length).toDouble() * 2, 400));
    return spotData;
  }

  LineChartData lineChartData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false
      ),
        gridData: FlGridData(
          getDrawingHorizontalLine: (v) {
            return FlLine(
              color: Colors.transparent,
            );
          },
          getDrawingVerticalLine: (v) {
            return FlLine(color: purpleColor, dashArray: [
              12,
            ]);
          },
          drawVerticalLine: true,
          verticalInterval: 2,
        ),
        lineTouchData: LineTouchData(
//            getTouchedSpotIndicator: (data, i) {
//              print(i);
//              print(data);
//              return [
//                TouchedSpotIndicatorData(
//                  FlLine(
//                    color: Colors.transparent
//                  ),
//                  FlDotData(show: true,
//                    strokeWidth: 10
//                  )
//                ),
//              ];
//            },
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: lightPurpleColor,
            tooltipRoundedRadius: 12,
            tooltipPadding: EdgeInsets.all(8),
            getTooltipItems: (index) {
              int pos = (index.first.x ~/ 2) - 1;
              List<LineTooltipItem> ret = [];

              if (pos != -1 && pos != this.dataSpots().length - 2) {
                ret.add(LineTooltipItem(
                    app.companyWeekRevenueData.first.weekRevenueData[pos].displayRevenue(),
                    TextStyle(
                        color: Colors.white
                    )
                ));
              } else {
                ret.add(LineTooltipItem(
                  "", TextStyle()
                ));
              }

              return ret;
            }
          ),
        ),
        titlesData: FlTitlesData(
            leftTitles: SideTitles(),
            bottomTitles: SideTitles(
                interval: 2,
                textStyle: TextStyle(
                  color: lightPurpleColor,
                ),
                getTitles: (index) {
                  String title = "";
                  List<FlSpot> spots = this.dataSpots();

                  spots.asMap().forEach((key, value) {
                    if (key != 0 && key != (spots.length - 1)) {
                      if ((index / 2) == key) {
                        title = app.companyWeekRevenueData.first
                            .weekRevenueData[key - 1]
                            .displayDay();
                      }
                    }
                  });

                  return title;
                },
                showTitles: true)),
        minY: 300,
        maxY: 550,
        lineBarsData: [
          LineChartBarData(
              show: true,
              isCurved: true,
//          curveSmoothness: 0.4,
              colors: [lightPurpleColor],
              barWidth: 4,
              dotData: FlDotData(show: false),
              spots: dataSpots())
        ]);
  }
}
