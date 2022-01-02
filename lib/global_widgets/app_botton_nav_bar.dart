import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNavBAr extends BottomNavigationBar{

  static List<Map> navItems = [
    {
      "icon": FontAwesomeIcons.home,
      "title":"Home"
    },
    {
      "icon":FontAwesomeIcons.solidChartBar,
      "title":"Statistics"
    },
    {
      "icon": FontAwesomeIcons.fileInvoice,
      "title":"Reports"
    },
    {
      "icon": FontAwesomeIcons.user,
      "title":"Profile"
    }
  ];

  AppBottomNavBAr({Function onTap, int index }):
        super(
        type: BottomNavigationBarType.fixed,
        onTap:onTap,
        currentIndex:index,
        items:navItems.map((item) =>
            BottomNavigationBarItem(
                icon: FaIcon(item["icon"]),
                label: item["title"],
            ),
        ).toList(),
        unselectedItemColor: AppColor.appTextMutedColor,
        fixedColor: AppColor.appColor,
        showUnselectedLabels:true,
        elevation:10.0,
        unselectedLabelStyle: TextStyle(
          fontSize: 11.2,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w400,
        ),
        selectedLabelStyle:TextStyle(
          fontSize: 11.6,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w700,
        ),
        iconSize:26.0,
      );
}
