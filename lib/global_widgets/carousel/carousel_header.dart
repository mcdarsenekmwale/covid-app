
import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:covid_app/global_widgets/carousel/carousel_indicator.dart';
import 'package:covid_app/global_widgets/carousel/carousel_item.dart';
import 'package:flutter/cupertino.dart';

class CarouselHeader extends StatefulWidget {
  @override
  _CarouselHeaderState createState() => _CarouselHeaderState();
}

class _CarouselHeaderState extends State<CarouselHeader> {

  int _currentItem = 0;
  static List<Map> carousels = [
    {
      "title":"Covid-19",
      "subtitle":"Symptoms",
      "description":"People may be sick with the virus for 1 to 14 days before developing symptoms"
    },
    {
      "title":"Covid-19",
      "subtitle":"Are you feeling sick?",
      "description":"If you feel sick with any of covid symptoms please call or sms us immediately for help"
    },
    {
      "title":"Covid-19",
      "subtitle":"Be Aware",
      "description":"Coronavirus  disease COVID-19 is an infectious disease caused by a new discovered corona virus."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
        height: MediaQuery.of(context).size.width * 0.724,
        width: AppConstant.appWidth,
        decoration: BoxDecoration(
          borderRadius: AppConstant.appHeaderBottomRadius,
          color: AppColor.appColor,
        ),
        child:Column(
          children: <Widget>[
            Expanded(
              child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    autoPlay: true,
                      height: MediaQuery.of(context).size.width * 0.65,
                    autoPlayAnimationDuration:Duration(microseconds: 500),
                    reverse: false,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: false,
                      onPageChanged: (index, reason) => setState(()=> _currentItem = index)
                  ),
                  items: carousels.map((carousel) => CarouselItem(
                      index: _currentItem,
                      title: carousel["title"],
                      subtitle: carousel["subtitle"],
                      description: carousel['description'],
                  )).toList()
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width *0.12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: carousels.asMap().entries.map((carousel)
                    => CarouselIndicator(
                      isActive: carousel.key == _currentItem,
                    )
                ).toList(),
              ),
            ),
          ],
        )

    );
  }
}
