
import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetItem extends StatelessWidget {
  final VoidCallback onTab;
  final String text;
  final IconData icon;

  const BottomSheetItem({
    Key key,
    @required this.onTab,
    @required  this.text,
    @required  this.icon
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding:  EdgeInsets.only(left: 8.0, top: 20.0, right: 8.0 ), //14 15 14
        width: Get.width*0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.035),
              decoration: BoxDecoration(
                color: Get.theme.accentColor,
                //shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color:  AppColor.secondaryBtnColor,
                    offset: Offset(0,2),
                    blurRadius: 6.0,
                  )
                ],
              ),
              child: Icon(icon, size: 25.0,
                  color:  Get.theme.scaffoldBackgroundColor
              ) ,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:  Get.theme.primaryColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                fontSize: MediaQuery.of(context).size.width*0.032 //delete
            ),)
          ],
        ),
      ),
    );
  }
}