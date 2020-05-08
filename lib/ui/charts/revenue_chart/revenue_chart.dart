import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:funinvest_ui_challenge/business_logic/app/app.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';
import 'package:funinvest_ui_challenge/ui/painter/dashed_line.dart';

class RevenueChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RevenueChartState();
  }
}

class _RevenueChartState extends State<RevenueChart> {
  App app = App();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: darkPurpleColor,
        borderRadius: BorderRadius.circular(36)
      ),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 28),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Total Revenue for the ...", style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 180,
                      child: BarChart(
                        barChart()
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.topRight,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: constraints.maxHeight,
                  width: 30,
                  child: CustomPaint(
                    painter: DashedLine(),
                  ),
                );
              },
            ),
          ),
        )
        ],
      ),
    );
  }

  List<BarChartGroupData> groupDataList() {
    List<BarChartGroupData> data = [];

    app.yearRevenueData.asMap().forEach((index, yrData) {
      data.add(BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            y: yrData.revenue,
            color: lightPurpleColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            width: 40,
          )
        ],
      ));
    });
    return data;
  }

  BarChartData barChart() {
    return BarChartData(
      barGroups: groupDataList(),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: SideTitles(),
        bottomTitles: SideTitles(
            showTitles: true,
            margin: -40,
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            reservedSize: 20,
            getTitles: (index) {
              return app.yearRevenueData[index.toInt()].displayDate();
            }),
      ),
      borderData: FlBorderData(show: false),
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: lightPurpleColor,
          tooltipRoundedRadius: 12,
          fitInsideHorizontally: true,
          tooltipPadding: EdgeInsets.all(8),
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
                app.yearRevenueData[groupIndex].displayRevenue(),
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600));
          },
        ),
      ),
    );
  }
}
