import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funinvest_ui_challenge/business_logic/app/app.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class CustomAppBar extends StatelessWidget {
  App app = App();

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: purpleColor,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.drag_handle,
            color: Colors.white,
          ),
//          _avatar(),
          ValueListenableBuilder(
            valueListenable: app.isHome,
            builder: (context, isHome, child) {
              return AnimatedCrossFade(
                crossFadeState: isHome ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: _bell(),
                secondChild: _avatar(),
                duration: Duration(milliseconds: 250),

              );
//              return isHome ? _bell() : _avatar();
            },
          ),

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
              backgroundImage: AssetImage(app.avatarLoc),
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

  Widget _bell() {
    return Container(
      height: 60,
      child: Center(
        child: Stack(
          children: <Widget>[
            Icon(CupertinoIcons.bell_solid,
            size: 30,
            color: Colors.white,),
            Positioned(
              top: 4,
              right: 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    color: purpleColor,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Container(
                    height: 8,
                    width: 8,
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
      ),
    );
  }
}