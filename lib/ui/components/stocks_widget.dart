import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:funinvest_ui_challenge/business_logic/model/investment.dart';
import 'package:funinvest_ui_challenge/ui/components/circle_arrow.dart';
import 'package:funinvest_ui_challenge/utils/dimens.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';

class StocksWidget extends StatelessWidget {
  Investment investment;
  Dimens dimens;

  StocksWidget({@required this.investment});

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Align(
      child: Container(
//        height: dimens.height * 0.14,
        decoration: BoxDecoration(
            color: darkPurpleColor, borderRadius: BorderRadius.circular(radius)),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        width: dimens.width * 0.62,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(investment.iconPath),
                radius: 26,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          investment.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          investment.stockValue,
                          style: TextStyle(
                              color: lightPurpleColor,
                              fontSize: 16
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircleArrow(up: investment.stockValue[0] == "-" ? false : true),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
