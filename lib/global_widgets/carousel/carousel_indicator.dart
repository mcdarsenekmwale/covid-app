import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CarouselIndicator extends StatelessWidget {
  final bool isActive;

  const CarouselIndicator({Key key, this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.0,
      height: 12.0,
      margin: EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? AppColor.appBgColor1
            : AppColor.appBgColor2.withOpacity(0.4),
      ),
    );
  }
}
