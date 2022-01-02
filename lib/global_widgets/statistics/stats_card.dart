
import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const StatsCard({Key key,@required this.title,@required  this.subtitle,@required  this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: Get.width*0.398,
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title,
          style: TextStyle(
            color: AppColor.appBgColor,
            fontSize: 15.0,
            fontWeight: FontWeight.w500
          ),
          ),
          SizedBox(height: 5.0,),
          Text(subtitle,
            style: TextStyle(
                color: AppColor.appBgColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w800
            ),
          )
        ],
      ),
    );
  }
}
