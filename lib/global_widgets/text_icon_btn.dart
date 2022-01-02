
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextIconBtn extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onClick;
  final Color color;

  const TextIconBtn({Key key,@required this.title,@required this.icon,@required this.onClick,@required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius:AppConstant.iconRadius,
          )
        ),
        icon: Padding(
          padding: EdgeInsets.only(left:10.0, top: 8.0, bottom: 8.0 ),
          child: Icon(icon, color: AppColor.appBgColor,),
        ),
        label: Padding(
          padding:  EdgeInsets.only(right:10.0, top: 8.0, bottom: 8.0 ),
          child: Text(title,
            style: TextStyle(
                color: AppColor.appBgColor,
                fontWeight: FontWeight.w500,
                fontSize: 15.0
            ),
          ),
        )
    );
  }
}


//text btn

class TextBtn extends StatelessWidget {
  final String title;
  final Function onClick;
  final Color color;

  const TextBtn({Key key,@required this.title,@required this.onClick,@required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
       style: ElevatedButton.styleFrom(
         primary: color,
         shape:RoundedRectangleBorder(
             borderRadius:AppConstant.iconRadius
         ),
       ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:10.0, vertical: 8.0),
          child: Text(title,
            style: TextStyle(
                color: AppColor.appBgColor,
                fontWeight: FontWeight.w700,
                fontSize: 16.0
            ),
          ),
        )
    );
  }
}
