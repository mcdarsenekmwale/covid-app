import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: AppConstant.appWidth,
            height: MediaQuery.of(context).size.width * 0.82,
            decoration:  BoxDecoration(
                color: AppColor.appColor,
                border: Border.all(width: 10.0, color: AppColor.appBgColor),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(600.0),
                    bottomLeft: Radius.circular(600.0)
                )
            ),
          ),
        ),
        Container(
          width: AppConstant.appWidth,
          height: MediaQuery.of(context).size.width * 0.77,
          decoration:  BoxDecoration(
              color: AppColor.appColor,
              border: Border.all(width: 10.0, color: AppColor.appBgColor),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(1908.0),
                  bottomLeft: Radius.circular(1980.0)
              )
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: AppConstant.appWidth,
            height: MediaQuery.of(context).size.width * 0.72,
            decoration:  BoxDecoration(
                color: AppColor.appBgColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(198.0),
                    bottomLeft: Radius.circular(198.0)
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: AppConstant.appVerSysPadding,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: AppColor.appColor,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                    maxRadius: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                Text('McDarsene Kelta',
                  style: TextStyle(
                      color: AppColor.appDarkTextColor,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w800
                  ),
                ),
                Text('Professional',
                  style: TextStyle(
                      color: AppColor.appDarkTextColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400
                  ),
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }
}
