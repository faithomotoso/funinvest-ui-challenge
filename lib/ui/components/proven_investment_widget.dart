import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funinvest_ui_challenge/business_logic/model/investment.dart';
import 'package:funinvest_ui_challenge/utils/dimens.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';

class ProvenInvestmentWidget extends StatelessWidget {
  Dimens dimens;
  final Investment provenInvestment;

  ProvenInvestmentWidget({@required this.provenInvestment});

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Align(
      child: Container(
        height: 200,
        width: dimens.width * 0.35,
        decoration: BoxDecoration(
          color: darkPurpleColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Align(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(provenInvestment.iconPath),
                          backgroundColor: Colors.transparent,
                          radius: 22,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: lightPurpleColor,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  provenInvestment.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: lightPurpleColor,
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(6),
                child: Center(
                  child: Text(
                    "Invest",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
