
import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppSideBarTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final VoidCallback onClick;

  const AppSideBarTile({Key key,@required this.icon,@required  this.title, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.only(top: 25),
        child: Row(
          children: <Widget>[
            Icon(icon,
              size: 28.0,
              color: AppColor.appDarkTextColor3,
            ),
            SizedBox(width: 20.0,),
            Text(title,
              style: TextStyle(
                  color: AppColor.appDarkTextColor3,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
