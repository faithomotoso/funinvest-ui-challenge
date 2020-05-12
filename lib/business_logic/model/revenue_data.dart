import 'package:flutter/cupertino.dart';

class RevenueData {
  double revenue;
  String date;
  String currency = "\$";

  RevenueData({@required this.revenue, @required this.date});

  String displayRevenue() => "${revenue.toInt()} $currency";

  String displayDate() {
    // display date with new line
    List<String> split = date.split(" ");
    return "${split.first}\n${split.last}";
  }

  String displayDay() {
    return date;
  }
}

class CompanyRevenueData {
  // weekly data shown in statistics page
  String companyName;
  String logoPath;
  List<RevenueData> weekRevenueData = [];

  CompanyRevenueData({
    this.companyName,
    this.logoPath,
    this.weekRevenueData
  });
}
