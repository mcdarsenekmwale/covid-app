
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:covid_app/global_widgets/prevention/prevention_card_item.dart';
import 'package:flutter/cupertino.dart';

class PreventionSection extends StatelessWidget {

  static List<Map> items1 = [
    {
      "title":"Stay at home",
      "image":"assets/images/home.png",
      'link': "https://youtu.be/p3pc9S2JwYo"
    },
    {
      "title":"Keep a safe distance",
      "image":"assets/images/distance.png",
      'link': "https://youtu.be/quNi23GQ89c"
    },
    {
      "title":"Wash hands often",
      "image":"assets/images/wash.png",
      'link': "https://youtu.be/GEIYCvcOHLw"
    }
  ];

  static List<Map> items2 = [
    {
      "title":"Cover coughs and sneezes",
      "image":"assets/images/cough.png",
      'link': "https://youtu.be/nsMgVtX05uA"
    },
    {
      "title":"Wear facemask if you are sick",
      "image":"assets/images/mask.png",
      'link': "https://youtu.be/adB8RW4I3o4"
    },
    {
      "title":"Clean and disinfect",
      "image":"assets/images/disinfect.png",
      'link': "https://youtu.be/ciUniZGD4tY"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppConstant.appSysPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
            child: Text('Prevention',
              style: TextStyle(
                  color: AppColor.appDarkTextColor2,
                  fontWeight: FontWeight.w900,
                  fontSize: 25.0
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: items1.map((item) =>
                      PreventionCardItem(
                          image: item["image"],
                          title: item["title"],
                          link: item["link"],
                      )).toList()
                ),
                SizedBox(height: 15.0,),
                Row(
                    children: items2.map((item) =>
                        PreventionCardItem(
                            image: item["image"],
                            title: item["title"],
                            link: item["link"],
                        )).toList()
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
