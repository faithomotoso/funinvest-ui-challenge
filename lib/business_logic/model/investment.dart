import 'package:flutter/cupertino.dart';

class Investment {
  String name;
  String iconPath;
  String description;
  String chanceOfProfit;
  String stockValue; // +1.0000000034

  Investment(
      {@required this.name,
      @required this.iconPath,
      this.description,
      this.chanceOfProfit,
      this.stockValue});
}

class NewInvestment extends Investment {
  String month; // Feb
  List<Day> days;

  NewInvestment(
      {@required String name,
      @required String iconPath,
      @required this.month,
      String description,
      String chanceOfProfit,
      String stockValue,
      this.days})
      : super(
            name: name,
            iconPath: iconPath,
            description: description,
            chanceOfProfit: chanceOfProfit,
            stockValue: stockValue);
}

class Day {
  // represents the days shown in statistics
  String day;
  bool isActive;

  Day({@required this.day, @required this.isActive});
}
