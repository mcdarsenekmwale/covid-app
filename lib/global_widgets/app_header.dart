
import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget{
final Function onDrawerOpen;

const AppHeader({Key key, this.onDrawerOpen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.appColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      flexibleSpace:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.sort, size: 36.0, color: Colors.white,),
                    onPressed:onDrawerOpen
                    ),
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.notifications_none,
                          size: 36.0,
                          color: Colors.white,),
                        onPressed: (){
                          Get.toNamed('/notifications');
                        }
                    ),
                    SizedBox(width: 10.0,),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      maxRadius: 24.0,
                    )
                  ],
                )
              ],
            ),
          )
      ) ,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight+ 20.0 );
}
