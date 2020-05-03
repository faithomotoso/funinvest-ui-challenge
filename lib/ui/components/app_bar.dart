import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: purpleColor,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.drag_handle,
            color: Colors.white,
          ),
          _avatar(),
        ],
      ),
    );
  }

  Widget _avatar(){
    return Container(
      height: 60,
      child: Stack(
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/avatar/avatar.jfif"),
              radius: 26,
            ),
          ),
          Positioned(
            top: 1,
            right: -2,
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: purpleColor,
                shape: BoxShape.circle
              ),
              child: Center(
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: lightPurpleColor,
                    shape: BoxShape.circle
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}