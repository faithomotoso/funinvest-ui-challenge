import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:funinvest_ui_challenge/business_logic/model/investment.dart';
import 'package:funinvest_ui_challenge/utils/dimens.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';

class NewInvestmentWidget extends StatelessWidget {
  Dimens dimens;
  Investment newInvestment;

  NewInvestmentWidget({@required this.newInvestment});

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Align(
      child: Container(
        width: dimens.width * 0.86,
//        height: 120,
        decoration: BoxDecoration(
            color: darkPurpleColor,
            borderRadius: BorderRadius.circular(radius)),
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _investmentDetails(investment: newInvestment),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "Chance of profit ",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 18
                    ),
                    children: [
                      TextSpan(
                        text: newInvestment.chanceOfProfit,
                        style: TextStyle(
                          color: lightPurpleColor
                        )
                      )
                    ]
                  ),
                ),
                FlatButton(
                  onPressed: (){},
                  color: lightPurpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                    child: Text("Invest", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _investmentDetails({@required Investment investment}) {
    bool _moreActivated = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(investment.iconPath),
                radius: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      investment.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.white,
                          letterSpacing: 0.8),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
//                    width: dimens.width * 0.6,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: dimens.width * 0.5,
                            child: Text(
                              newInvestment.description,
                              maxLines: !_moreActivated ? 3 : 6,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _moreActivated = !_moreActivated;
                                });
                              },
                              child: Text(
                                !_moreActivated ? "more" : "less",
                                style: TextStyle(
                                    color: lightPurpleColor, fontSize: 14),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
