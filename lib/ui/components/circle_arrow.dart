import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';

Widget CircleArrow({bool up = false}) {
  return Container(
    height: 22,
    width: 22,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: lightPurpleColor,
    ),
    child: Center(
      child: Icon(
        !up ? Icons.arrow_drop_down : Icons.arrow_drop_up,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}