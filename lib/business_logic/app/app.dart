import 'package:flutter/material.dart';
import 'package:funinvest_ui_challenge/business_logic/model/investment.dart';
import 'package:funinvest_ui_challenge/business_logic/model/revenue_data.dart';

class App {
  static final App _instance = App._privateInstance();

  App._privateInstance();

  factory App() {
    return _instance;
  }

  ValueNotifier<bool> isHome =
      ValueNotifier<bool>(true); // modify app bar depending on current page
  String avatarLoc = "assets/avatar/avatar.jfif";
  String userName = "Anna Yashina";
  double accountBalance = 2452.87;

  List<Investment> _provenInvestments = [
    Investment(
        name: "Google",
        iconPath: "assets/company_icons/google-logo.png",
        stockValue: "+1.00000675\$"),
    Investment(
        name: "Yandex",
        iconPath: "assets/company_icons/yandex-logo.png",
        stockValue: "-2.00000055\$"),
    Investment(
        name: "Huawei",
        iconPath: "assets/company_icons/huawei-logo.png",
        stockValue: "+1.0000023\$"),
    Investment(
        name: "Sony",
        iconPath: "assets/company_icons/sony-logo.png",
        stockValue: "-1.00000009\$")
  ];
  List<Investment> _newInvestments = [
    Investment(
        name: "MoniCurity",
        iconPath: "assets/company_icons/monicurity-logo.png",
        description:
            """An organization that protects against hacker attacks from the internet.\nThis organization was founded with the internet security at the heart of its opertations.
      """,
        chanceOfProfit: "31%"),
    Investment(
        name: "MoniCurity",
        iconPath: "assets/company_icons/monicurity-logo.png",
        description:
            """An organization that protects against hacker attacks from the internet.\nThis organization was founded with the internet security at the heart of its opertations.
      """,
        chanceOfProfit: "31%"),
    Investment(
        name: "MoniCurity",
        iconPath: "assets/company_icons/monicurity-logo.png",
        description:
            """An organization that protects against hacker attacks from the internet.\nThis organization was founded with the internet security at the heart of its opertations.
      """,
        chanceOfProfit: "31%"),
    Investment(
        name: "MoniCurity",
        iconPath: "assets/company_icons/monicurity-logo.png",
        description:
            """An organization that protects against hacker attacks from the internet.\nThis organization was founded with the internet security at the heart of its opertations.
      """,
        chanceOfProfit: "31%")
  ];

  List<RevenueData> _yearRevenueData = [
    RevenueData(
      revenue: 450,
      date: "Oct 19"
    ),
    RevenueData(
      revenue: 820,
      date: "Nov 19"
    ),
    RevenueData(
      revenue: 530,
      date: "Dec 19"
    ),
    RevenueData(
      revenue: 900,
      date: "Jan 20"
    ),
    RevenueData(
      revenue: 650,
      date: "Feb 20"
    )
  ];

  List<Investment> get provenInvestments => _provenInvestments;

  List<Investment> get newInvestments => _newInvestments;

  List<RevenueData> get yearRevenueData => _yearRevenueData;
}
