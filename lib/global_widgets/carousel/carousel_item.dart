import 'package:covid_app/pages/home/home_controller.dart';
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/global_widgets/text_icon_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CarouselItem extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  final int index;
  final String title;
  final String subtitle;
  final String description;

  CarouselItem({Key key,@required this.title,@required this.subtitle,@required this.description,@required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 40.0
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (index != 0)?
                        SizedBox(height: 12.0,):
                        Container(),
                    Text(subtitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 24.0
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(description,
                      style: TextStyle(
                          color: AppColor.appBgColor2,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Open-sans',
                          fontSize: 15.0
                      ),
                    ),
                  ],
                ),
              ),
            ),
            (index != 0)?
                Container():
                Expanded(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 32.0,
                      left: 21.0,
                      child: CircleAvatar(
                        backgroundColor: AppColor.yellowCardColor,
                        maxRadius: 60.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Image.asset('assets/images/covid_19.png',
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        (index != 0)?
        buildBottomBtn(index):
        Container()
      ],
    );
  }

  Widget buildBottomBtn(index){
    return  Visibility(
      visible:  index ==1 ,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
                TextIconBtn(
                    title: 'Call Now',
                    icon: Icons.call,
                    onClick: () async{
                      await _controller.makePhoneCall();
                    },
                    color: AppColor.redCardColor
                ),
                TextIconBtn(
                    title: 'Send SMS',
                    icon: FontAwesomeIcons.solidComment,
                    onClick: () async{
                      await _controller.setSMS();
                    },
                    color: Colors.blue.shade600
                ),
          ],
        ),
      ),
      replacement:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.all(2.0),
            child: TextBtn(
                title: 'Learn Awareness',
                onClick: (){
                  Get.toNamed('/app-web-viewer',
                      arguments: "https://www.cdc.gov/coronavirus/2019-ncov/your-health/need-to-know.html");
                },
                color: AppColor.redCardColor
            ),
          ),
        ],
      ),
    );
  }

}
