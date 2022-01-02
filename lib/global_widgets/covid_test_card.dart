import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CovidTestCard extends StatelessWidget {

  final Function onClick;

  const CovidTestCard({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: AppConstant.appSysPadding,
          padding: EdgeInsets.all(15.0),
          height: Get.height*0.28,
          width: Get.width * 0.98,
          decoration: BoxDecoration(
              color: AppColor.yellowCardColor,
              borderRadius: BorderRadius.circular(12.0)
          ),
          child: Stack(
            children: <Widget>[
              Text('Need to test Covid-19',
                style: TextStyle(
                    color: AppColor.appColor,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Poppins',
                    fontSize: 22.0
                ),),
              Padding(
                padding: EdgeInsets.only(top:  Get.height*0.05),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text('There are laboratory tests that can  identify the virus that causes COVID-19 in respiratory specimens.',
                            style: TextStyle(
                                color: AppColor.appColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 14.5
                            ),),
                          SizedBox(height: 15.0,),
                          ElevatedButton(
                            onPressed: ()=>onClick,
                            style: ElevatedButton.styleFrom(
                                primary: AppColor.appColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical:12.0),
                              child: Text('Testing Book Now'.toUpperCase(),
                                style: TextStyle(
                                    color: AppColor.appBgColor,
                                    fontFamily: 'Open-sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17.0
                                ),),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width*0.3,
                    )
                  ],
                ),
              ),
              Positioned(
                right: Get.width*0.17,
                top: 10,
                child: SvgPicture.asset(
                  "assets/icons/virus.svg",
                  color: AppColor.appColor,
                  height: 35.0,
                  width: 35.0,
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/images/doctor.png')
              )
            ],
          ),
        ),

      ],
    );
  }
}
