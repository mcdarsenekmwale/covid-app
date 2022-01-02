
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:covid_app/global_widgets/statistics/stat_header_item.dart';
import 'package:flutter/cupertino.dart';

class StatTopHeader extends StatelessWidget {
  final int index;
  final Function onNavigation;

  static List<String> items = [
    "My Country",
    "Global"
  ];

  const StatTopHeader({Key key, @required this.index,@required this.onNavigation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppConstant.appVerSysPadding,
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
          color: AppColor.secondaryBtnColor.withOpacity(0.5),
          borderRadius: AppConstant.iconRadius
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.asMap().entries.map(
                  (MapEntry map) =>
                  Expanded(
                    child: GestureDetector(
                      onTap: ()=>onNavigation(map.key),
                      child: StatHeaderItem(
                        title: map.value,
                        isActive: index == map.key,
                      ),
                    ),
                  )
          ).toList()
      ),
    );
  }
}
