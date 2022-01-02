import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CovidVaccineCard extends StatelessWidget {

  final Function onClick;

  const CovidVaccineCard({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppConstant.appSysPadding,
      padding: EdgeInsets.all(15.0),
      width: Get.width * 0.98,
      height: Get.height*0.28,
      decoration: BoxDecoration(
          color: AppColor.iconColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12.0)
      ),
      child: Stack(
        children: <Widget>[
          Text('Getting Covid-19 Vaccine',
            style: TextStyle(
                color: AppColor.appBgColor,
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

                      Text('After you’ve been fully vaccinated, you can start to do some things that you had to stop doing because of the pandemic.',
                        style: TextStyle(
                            color: AppColor.appBgColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0
                        ),),
                      SizedBox(height: 15.0,),
                      ElevatedButton(
                        onPressed: ()=>onClick,
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.redCardColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical:12.0),
                          child: Text('Vaccine Book Now'.toUpperCase(),
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
            right: Get.width*0.2,
            top: 27,
            child: SvgPicture.asset(
              "assets/icons/virus.svg",
              color: AppColor.yellowCardColor,
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
    );
  }
}
