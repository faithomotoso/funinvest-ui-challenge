import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:funinvest_ui_challenge/ui/components/app_bar.dart';
import 'package:funinvest_ui_challenge/ui/pages/catalog.dart';
import 'package:funinvest_ui_challenge/ui/pages/profile.dart';
import 'package:funinvest_ui_challenge/ui/pages/settings.dart';
import 'package:funinvest_ui_challenge/ui/pages/statistics.dart';
import 'package:funinvest_ui_challenge/utils/dimens.dart';
import 'package:funinvest_ui_challenge/utils/utils.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Dimens dimens;
  int _pageIndex = 0;
  List pages = [
    ProfilePage(),
    StatisticsPage(),
    CatalogPage(),
    SettingsPage(),
  ];


  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CustomAppBar(),
            SizedBox(
              height: 10,
            ),
            Expanded(
//            child: pages[_pageIndex],
              child: PageTransitionSwitcher(
                transitionBuilder: (Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation){
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                duration: Duration(milliseconds: 300),
                child: pages[_pageIndex],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: darkPurpleColor,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ]
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
            child: GNav(
              activeColor: Colors.white,
              iconSize: 26,
              gap: 6,
              curve: Curves.fastOutSlowIn,
              selectedIndex: _pageIndex,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              color: lightPurpleColor,
              tabBackgroundColor: lightPurpleColor,
              onTabChange: (index){
                setState(() {
                  _pageIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: "Home",

                ),
                GButton(
                  icon: LineIcons.dashcube,
                  text: "Statistics",
                ),
                GButton(
                  icon: LineIcons.binoculars,
                  text: "Catalog",
                ),
                GButton(
                  icon: LineIcons.user_times,
                  text: "Settings",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}