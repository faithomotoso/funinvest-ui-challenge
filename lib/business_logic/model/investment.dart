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
