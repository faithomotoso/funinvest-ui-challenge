import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funinvest_ui_challenge/business_logic/app/app.dart';
import 'package:funinvest_ui_challenge/ui/components/statistics_month_widget.dart';
import 'package:funinvest_ui_challenge/utils/dimens.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';
import 'package:funinvest_ui_challenge/ui/charts/week_revenue_chart.dart';

class StatisticsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _StatisticsPageState();
  }
}

class _StatisticsPageState extends State<StatisticsPage> {
  App app = App();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: purpleColor,
      padding: EdgeInsets.only(top: topPadding + 30, left: 30, right: 30),
      child: ListView(
        padding: EdgeInsets.only(bottom: 10),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          WeekRevenueChart(),
          SizedBox(
            height: 16,
          ),
          ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: app.newInvestments.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return StatisticsMonthWidget(
                newInvestment: app.newInvestments[index],
              );
            },
          )
        ],
      ),
    );
  }
}