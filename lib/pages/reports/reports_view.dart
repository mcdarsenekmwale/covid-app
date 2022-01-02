import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:covid_app/global_widgets/self_check_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'reports_controller.dart';

class ReportsView extends  GetView<ReportsController>  {
  const ReportsView({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppConstant.appHeight,
        width: AppConstant.appWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.86,
                decoration: BoxDecoration(
                  borderRadius: AppConstant.appHeaderBottomRadius,
                  gradient: LinearGradient(
                      colors: [
                        AppColor.appColor.withOpacity(1),
                        AppColor.appColor.withOpacity(0.1),
                        AppColor.appColor.withOpacity(0.1),

                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.calendar_today, color: AppColor.appBgColor1,),
                        SizedBox(width: 10.0,),
                        Text(DateFormat.yMMMMd().format(DateTime.now()),
                          style: TextStyle(
                              color: AppColor.appBgColor1,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 40.0,),
                    Expanded(
                      child: CalendarDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(3019),
                          initialCalendarMode: DatePickerMode.day,
                          onDateChanged: (value){

                          }
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0
                ),
                child: Text("Cumulative Overview ",
                  style: TextStyle(
                      color: AppColor.appDarkTextColor3,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:12.0),
                child: SelfCheckCard(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
  