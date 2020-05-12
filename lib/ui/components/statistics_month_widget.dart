import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funinvest_ui_challenge/business_logic/model/investment.dart';
import 'package:funinvest_ui_challenge/ui/components/circle_arrow.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';

class StatisticsMonthWidget extends StatelessWidget {
  NewInvestment newInvestment;

  StatisticsMonthWidget({@required this.newInvestment});

  String _selectedOption = "more";
  List<String> _options = ["more"];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35), color: darkPurpleColor),
//      padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      newInvestment.month,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleArrow(
                        up: newInvestment.stockValue[0] == "-" ? false : true)
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 35,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    separatorBuilder: (context, i) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: newInvestment.days.length,
                    itemBuilder: (context, index) {
                      return dayWidget(day: newInvestment.days[index]);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(newInvestment.iconPath),
                          radius: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              newInvestment.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6
                              ),
                            ),
                            Text(
                              newInvestment.stockValue,
                              style: TextStyle(
                                color: lightPurpleColor,
                                fontSize: 16,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onChanged: (v){
                            setState(() {
                              v = _selectedOption;
                            });
                          },
                          value: _selectedOption,
                          isDense: true,
                          style: TextStyle(
                            color: lightPurpleColor,
                            fontSize: 20
                          ),
                          items: _options.map((e) => DropdownMenuItem(
                            value: _selectedOption,
                            child: Text(_selectedOption),
                          )).toList(),
                        ),
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

  Widget dayWidget({@required Day day}) {
    return Container(
      width: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:
              day.isActive ? lightPurpleColor : Colors.white.withOpacity(0.4)),
      child: Center(
          child: Text(
        day.day,
        style: TextStyle(color: Colors.white, fontSize: 12),
      )),
    );
  }
}
