
import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileTile(
      {Key key,
        @required this.icon,
        @required this.title,
        @required this.onTap
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon,
                  color: AppColor.appBgColor2,
                  size: 33.0,
                ),
                SizedBox(width: 30.0,),
                Text(title,
                  style: TextStyle(
                      color: AppColor.appBgColor2,
                      //fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                    letterSpacing: 0.4
                  ),)
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
