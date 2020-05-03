import 'package:flutter/cupertino.dart';

class Investment {
  String name;
  String iconPath;
  String description;
  String chanceOfProfit;

  Investment({@required this.name, @required this.iconPath, this.description, this.chanceOfProfit});
}