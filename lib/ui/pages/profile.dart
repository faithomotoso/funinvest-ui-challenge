import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:funinvest_ui_challenge/business_logic/app/app.dart';
import 'package:funinvest_ui_challenge/ui/components/circle_arrow.dart';
import 'package:funinvest_ui_challenge/ui/components/stocks_widget.dart';
import 'package:funinvest_ui_challenge/utils/dimens.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';
import 'package:funinvest_ui_challenge/ui/charts/revenue_chart.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  App app = App();
  Dimens dimens;
  final _moneyController = MoneyMaskedTextController(
    rightSymbol: "\$",
    decimalSeparator: " ",
    thousandSeparator: " ",
  );


  @override
  void initState() {
    super.initState();
    _moneyController.text = app.accountBalance.toString();
  }

  @override
  void dispose() {
    _moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      color: purpleColor,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: lightPurpleColor.withOpacity(0.35),
                          blurRadius: 70,
                          spreadRadius: 42
                      )
                    ]
                ),
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  children: <Widget>[
                    profileAvatar(),
                    SizedBox(
                      height: 14,
                    ),
                    Text(app.userName,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.7,
                          fontSize: 26
                      ),),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: dimens.width * 0.6,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: CircleArrow(up: true),
                    ),
                    TextField(
                      controller: _moneyController,
                      decoration: InputDecoration.collapsed(hintText: null),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 46,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 18),
            child: Text(
              "Stocks",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 22
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 4,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 20
                );
              },
              itemCount: app.provenInvestments.length,
              padding: EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return StocksWidget(investment: app.provenInvestments[index],);
              },
            )
          ),
          SizedBox(
            height: 20,
          ),
          RevenueChart(),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget profileAvatar() {
    return Container(
      height: 120,
      width: 100,
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(app.avatarLoc),
            radius: 50,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 100,
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                      color: lightPurpleColor,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Text("Pro",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22
                  ),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}