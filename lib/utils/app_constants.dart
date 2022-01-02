import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConstant{

  static ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColor.appColor,
    accentColor: AppColor.secondaryBtnColor,
    backgroundColor: Color(0xFFFCFCFC),
    scaffoldBackgroundColor: Color(0xFFF7F8FD),

  );
  static EdgeInsets appSysPadding = EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0);
  static EdgeInsets appHorSysPadding = EdgeInsets.symmetric(horizontal: 10.0);
  static EdgeInsets appVerSysPadding = EdgeInsets.symmetric(vertical: 20.0);
  static double appHeight = double.infinity;
  static double appWidth = double.infinity;
  static BorderRadius appRadius = BorderRadius.circular(20.0);

  static BorderRadius appTopRadius = BorderRadius.only(
    topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)
  );
  static BorderRadius appBottomRadius = BorderRadius.only(
      bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)
  );
  static BorderRadius appHeaderBottomRadius = BorderRadius.only(
      bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)
  );
  static BorderRadius iconRadius = BorderRadius.circular(60.0);
}

messageDisplay({String text}){
  Get.snackbar('','',
      snackPosition: SnackPosition.BOTTOM ,
      backgroundColor: Colors.black,
      messageText: Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12.0,
          color: Colors.white,
        ),
      ),
      titleText: Container(),
      margin: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0
      )
  );
}