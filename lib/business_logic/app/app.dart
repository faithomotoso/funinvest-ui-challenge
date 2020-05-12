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
  List<NewInvestment> _newInvestments = [
    NewInvestment(
        name: "MoniCurity",
        month: "Feb",
        iconPath: "assets/company_icons/monicurity-logo.png",
        description:
            "An organization that protects against hacker attacks from the internet.\nThis organization was founded with the internet security at the heart of its opertations.",
        chanceOfProfit: "31%",
        stockValue: "+5.136.23",
    days: List.generate(28, (index) {
      index += 1;
      bool isActive = false;
      if (index == 18 || index == 19) {
        isActive = true;
      }
      return Day(
        day: index.toString(),
        isActive: isActive
      );
    })),
    NewInvestment(
        name: "SpaceX",
        month: "Feb",
        iconPath: "assets/company_icons/spacex-logo.jfif",
        description:
            "SpaceX has been conducting research and development operations in the field of empowering missions in space.",
        chanceOfProfit: "31%",
        stockValue: "-1.252.14",
    days: List.generate(28, (index) {
      index += 1;
      bool isActive = false;
      if (index >= 18 && index <= 20) {
        isActive = true;
      }
      return Day(
        day: index.toString(),
        isActive: isActive
      );
    })),
  ];

  List<RevenueData> _yearRevenueData = [
    RevenueData(revenue: 450, date: "Oct 19"),
    RevenueData(revenue: 820, date: "Nov 19"),
    RevenueData(revenue: 530, date: "Dec 19"),
    RevenueData(revenue: 900, date: "Jan 20"),
    RevenueData(revenue: 650, date: "Feb 20")
  ];

  List<CompanyRevenueData> _companyWeekRevenueData = [
    CompanyRevenueData(
        companyName: "SpaceX",
        logoPath: "assets/company_icons/spacex-logo.jfif",
        weekRevenueData: [
          RevenueData(revenue: 460, date: "Mon"),
          RevenueData(revenue: 470, date: "Tue"),
          RevenueData(revenue: 452, date: "Wed"),
          RevenueData(revenue: 420, date: "Thu"),
          RevenueData(revenue: 430, date: "Fri"),
          RevenueData(revenue: 490, date: "Sat"),
          RevenueData(revenue: 480, date: "Sun")
        ])
  ];

  List<Investment> get provenInvestments => _provenInvestments;

  List<NewInvestment> get newInvestments => _newInvestments;

  List<RevenueData> get yearRevenueData => _yearRevenueData;

  List<CompanyRevenueData> get companyWeekRevenueData =>
      _companyWeekRevenueData;
}
