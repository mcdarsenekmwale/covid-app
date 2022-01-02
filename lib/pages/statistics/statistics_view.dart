import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:covid_app/global_widgets/statistics/category_header.dart';
import 'package:covid_app/global_widgets/statistics/covid_line_chart.dart';
import 'package:covid_app/global_widgets/statistics/stat_top_header.dart';
import 'package:covid_app/global_widgets/statistics/stats_section.dart';

import 'statistics_controller.dart';

class StatisticsView extends  GetView<StatisticsController>  {
  const StatisticsView({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 5.0, left: 25.0, right: 25.0),
                  height: MediaQuery.of(context).size.width * 0.9,
                  width: AppConstant.appWidth,
                  decoration: BoxDecoration(
                    borderRadius: AppConstant.appHeaderBottomRadius,
                    color: AppColor.appColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Statistics',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 40.0
                        ),
                      ),
                      StatTopHeader(
                          index: controller.tabIndex.value,
                          onNavigation: controller.onChangeTab
                      ),
                      CategoryHeader(
                        index: controller.currentCategoryIndex.value,
                        onClick: controller.onChangeCategory,
                      ),
                      StatsCardSection()
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:EdgeInsets.only(top: 20.0, left: 20.0, ),
                        child: Text(
                          'Logarithmic',
                          style: TextStyle(
                              color: AppColor.appDarkTextColor3,
                              fontSize: 23.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: AppConstant.appSysPadding,
                        child: CovidLineChart(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  