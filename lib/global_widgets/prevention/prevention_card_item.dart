import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreventionCardItem extends StatelessWidget {

  final String image;
  final String title;
  final String link;

  const PreventionCardItem({
    Key key,@required this.image,@required this.title, 
    this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: ()=>Get.toNamed('/app-web-viewer', arguments: link),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.lightBlueCardColor,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: AppColor.appBgColor1, width: 1.0)
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  maxRadius: 27.0,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:6.0, right: 10.0),
              child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.appDarkTextColor2,
                    fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0 //delete
              ),),
            )
          ],
        ),
      ),
    );
  }
}
