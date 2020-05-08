import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funinvest_ui_challenge/utils/dimens.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  final offWhite = Colors.white.withOpacity(0.66);

  List<_SettingsItem> items = [
    _SettingsItem(name: "Account", icon: Icons.person),
    _SettingsItem(name: "Privacy", icon: Icons.vpn_key),
    _SettingsItem(name: "Decoration", icon: CupertinoIcons.pencil),
    _SettingsItem(name: "Notification", icon: CupertinoIcons.bell_solid),
    _SettingsItem(name: "Support", icon: Icons.chat_bubble)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: purpleColor,
      padding: EdgeInsets.only(top: topPadding + 30),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 30,
          );
        },
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Icon(
                items[index].icon,
                color: offWhite,
                size: 24,
              ),
              SizedBox(
                width: 26,
              ),
              Text(
                items[index].name,
                style: TextStyle(
                  color: offWhite,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class _SettingsItem {
  String name;
  IconData icon;

  _SettingsItem({@required this.name, @required this.icon});
}