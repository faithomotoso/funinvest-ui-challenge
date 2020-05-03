import 'package:funinvest_ui_challenge/business_logic/model/investment.dart';

class App {
  List<Investment> _provenInvestments = [
    Investment(
        name: "Google", iconPath: "assets/company_icons/google-logo.png"),
    Investment(
        name: "Yandex", iconPath: "assets/company_icons/yandex-logo.png"),
    Investment(
        name: "Huawei", iconPath: "assets/company_icons/huawei-logo.png"),
    Investment(name: "Sony", iconPath: "assets/company_icons/sony-logo.png")
  ];
  List<Investment> _newInvestments = [
    Investment(
        name: "MoniCurity",
        iconPath: "assets/company_icons/monicurity-logo.png",
        description: """An organization that protects against hacker attacks from the internet.\nThis organization was founded with the internet security at the heart of its opertations.
      """,
        chanceOfProfit: "31%"),
    Investment(
        name: "MoniCurity",
        iconPath: "assets/company_icons/monicurity-logo.png",
        description: """An organization that protects against hacker attacks from the internet.\nThis organization was founded with the internet security at the heart of its opertations.
      """,
        chanceOfProfit: "31%"),
    Investment(
        name: "MoniCurity",
        iconPath: "assets/company_icons/monicurity-logo.png",
        description: """An organization that protects against hacker attacks from the internet.\nThis organization was founded with the internet security at the heart of its opertations.
      """,
        chanceOfProfit: "31%"),
    Investment(
        name: "MoniCurity",
        iconPath: "assets/company_icons/monicurity-logo.png",
        description: """An organization that protects against hacker attacks from the internet.\nThis organization was founded with the internet security at the heart of its opertations.
      """,
        chanceOfProfit: "31%")
  ];

  List<Investment> get provenInvestments => _provenInvestments;
  List<Investment> get newInvestments => _newInvestments;
}
