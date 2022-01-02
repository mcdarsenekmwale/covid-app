import 'package:covid_app/pages/statistics/statistics_controller.dart';
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/global_widgets/statistics/stats_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsCardSection extends StatelessWidget {

  final controller = Get.find<StatisticsController>();


  @override
  Widget build(BuildContext context) {

    var stats_1 = [
      {
        "title":"Tocal Cases",
        "color": AppColor.lightBlueCardColor
      },
      {
        "title":"Active Cases",
        "color": AppColor.yellowCardColor
      },
      {
        "title":"Recovered Cases",
        "color": AppColor.greenCardColor
      },
      {
        "title":"Deaths",
        "color": AppColor.redCardColor
      }
    ];
    return Obx(()=>
        Container(
        margin:EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10.0,
              runSpacing: 2.0,
              children: stats_1.asMap().entries.map((stat) => StatsCard(
                  title: stat.value["title"],
                  subtitle: controller.listOfStats[stat.key].toString(),
                  color: stat.value["color"]
              ) ).toList(),
            ),

          ],
        ),
      ),
    );
  }
}
