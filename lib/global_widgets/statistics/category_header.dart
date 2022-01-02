
import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {

  final dynamic index;
  final Function onClick;
  const CategoryHeader({Key key,@required this.index,@required this.onClick}) : super(key: key);

  static List<String> categories = [
    "Total",
    "Today",
    "Yesterday"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Row(
            children: categories.asMap().entries.map((category) =>
              GestureDetector(
                onTap: ()=>onClick(category.key),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(category.value,
                  style: TextStyle(
                    color: (index == category.key)? AppColor.appBgColor:
                        AppColor.appBgColor2.withOpacity(0.5),
                    fontWeight: (index == category.key)? FontWeight.w700:
                        FontWeight.w400,
                    fontSize: 16.0,
                    letterSpacing: 0.4
                  ),
                  ),
                ),
              )
            ).toList(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: GestureDetector(
            onTap: ()=>onClick(4),
            child: Icon(Icons.dashboard,
              color: (index == 4)? AppColor.appBgColor:
              AppColor.appBgColor2.withOpacity(0.5),
              size: 24.0,
            ),
          ),
        )
      ],
    );
  }
}
