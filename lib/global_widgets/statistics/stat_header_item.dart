
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatHeaderItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const StatHeaderItem({Key key, this.title, this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 30.0),
      decoration: BoxDecoration(
        borderRadius: AppConstant.iconRadius,
        color: isActive? AppColor.appBgColor: Colors.transparent,
      ),
      child: Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: isActive? AppColor.appColor: AppColor.appBgColor,
            fontSize: 20.0,
            letterSpacing: 0.3,
            fontWeight: isActive?  FontWeight.w700:FontWeight.w400
        ),
      ),
    );
  }
}
