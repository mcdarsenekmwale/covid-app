import 'package:covid_app/services/main_services.dart';
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/global_widgets/app_side_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppSideBar extends StatelessWidget {
  final _controller = Get.find<MainServices>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 10.0,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width/2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColor.appColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0)
                )
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment:Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top:50.0, right: 8.0),
                      child: SvgPicture.asset(
                        "assets/icons/virus1.svg",
                        color: AppColor.appBgColor2.withOpacity(0.8),
                        height: 35.0,
                        width: 35.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment:Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom:50.0, right: 8.0),
                      child: SvgPicture.asset(
                        "assets/icons/virus1.svg",
                        color: AppColor.appBgColor2.withOpacity(0.8),
                        height: 40.0,
                        width: 35.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment:Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 50.0),
                      child: SvgPicture.asset(
                        "assets/icons/virus1.svg",
                        color: AppColor.appBgColor2.withOpacity(0.8),
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment:Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text('COVID-19 APP',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 24.0
                      ),
                      )
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width /4,),
            Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.width/1.5, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppSideBarTile(
                      icon: FontAwesomeIcons.thermometerThreeQuarters,
                      title: "Self Test",
                    onClick: (){},
                  ),
                  AppSideBarTile(
                      icon: FontAwesomeIcons.qrcode,
                      title: "Heath Code",
                    onClick: (){
                        _controller.scaffoldKey.currentState.openEndDrawer();
                        Get.toNamed('/health-code');
                    },
                  ),
                  AppSideBarTile(
                      icon: FontAwesomeIcons.hireAHelper,
                      title: "Quick Help",
                    onClick: (){

                    },
                  ),
                  AppSideBarTile(
                      icon: FontAwesomeIcons.phoneAlt,
                      title: "Helpline",
                    onClick: (){

                    },
                  )
                ],
              ),
            ),
            Align(
              alignment:Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icons/virus.svg",
                  color: AppColor.appColor.withOpacity(0.8),
                  height: 100.0,
                  width: 65.0,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
