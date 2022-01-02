
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelfCheckCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: AppConstant.appVerSysPadding,
      padding: EdgeInsets.all(15.0),
      height: MediaQuery.of(context).size.height*0.25,
      width: MediaQuery.of(context).size.width * 0.98,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.secondaryBtnColor.withOpacity(0.5),
            AppColor.appBgColor2,
            AppColor.appBgColor2,

          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft
        ),
          borderRadius: AppConstant.appRadius
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment:Alignment.topRight,
            child: Padding(
              padding:  EdgeInsets.only(top:8.0, ),
              child: Text('Self Check up Covid-19',
                style: TextStyle(
                    color: AppColor.appColor,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0
                ),),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.05),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text('Contain several list of questions to check up your physical condition',
                        style: TextStyle(
                            color: AppColor.appColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 14.20
                        ),),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                              iconSize: 30.0,
                              icon: Container(
                                  padding: EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                      color:AppColor.appColor,
                                      borderRadius: AppConstant.appRadius
                                  ),
                                  child: Icon(Icons.arrow_forward_ios, color: Colors.white,)),
                              onPressed: (){}
                          ),
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
          Positioned(
              top: -0.0,
              left: -30.0,
              child: Image.asset('assets/images/scan.png',
                scale: 1.1,
              )
          )
        ],
      ),
    );
  }
}
