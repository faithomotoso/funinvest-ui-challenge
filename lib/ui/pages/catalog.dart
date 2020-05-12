import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:funinvest_ui_challenge/business_logic/app/app.dart';
import 'package:funinvest_ui_challenge/ui/components/proven_investment_widget.dart';
import 'package:funinvest_ui_challenge/utils/dimens.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';

class CatalogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatalogPageState();
  }
}

class _CatalogPageState extends State<CatalogPage> {
  Dimens dimens;
  App app = App();
  final TextStyle _headerTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4,
      fontSize: 22);

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      color: purpleColor,
      padding: EdgeInsets.only(top: topPadding + 30),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "New Investments",
              style: _headerTextStyle,
            ),
          ),
          SizedBox(
            height: 22,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              // using Row might affect performance if the list is longer
              // using listview requires fixed height, affects the dynamic height of each widget
              children: <Widget>[
                for (int i = 0; i < app.newInvestments.length; i++)
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      NewInvestmentWidget(
                        newInvestment: app.newInvestments[i],
                      ),
                      SizedBox(
                        width: i == app.newInvestments.length - 1 ? 16 : 0,
                      )
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Proven Investments",
              style: _headerTextStyle,
            ),
          ),
          SizedBox(
            height: 22,
          ),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 30),
              itemCount: app.provenInvestments.length,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              itemBuilder: (context, index) {
                return ProvenInvestmentWidget(
                  provenInvestment: app.provenInvestments[index],
                );
              }),
        ],
      ),
    );
  }
}
