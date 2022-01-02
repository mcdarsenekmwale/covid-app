import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;

import 'health_code_controller.dart';

class HealthCodeView extends  GetView<HealthCodeController>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0.0,
        leading: IconButton(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(Icons.arrow_back_ios,
            color: Get.theme.scaffoldBackgroundColor,
          ),
          iconSize: 28.0,
          onPressed: (){
            Get.back();
          },
        ),
        actions: [

        ],
        toolbarHeight: kToolbarHeight+ 2.0,
        backgroundColor: Get.theme.primaryColor,
        title: Text('Health Code',
          style: TextStyle(
            fontSize: 19.0,
            fontFamily: 'Poppins',

          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.arrow_back_ios,
                      color:  Colors.white.withOpacity(0.9),
                    ),
                    iconSize: 30.0,
                    onPressed: (){
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 25.0
                    ) .copyWith(top: 2),
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0
                    ),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1.0,
                              blurRadius: 1.0,
                              color: Color(0xc1999898),
                              offset: Offset(1.00, 1.00)
                          ),
                        ]
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(DateFormat.yMMMMd().add_Hms().format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            letterSpacing: 0.2,
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        FutureBuilder<ui.Image>(
                          future: controller.loadOverlayImage(),
                          builder: (context, snapshot) {
                            final size = 280.0;
                            if (!snapshot.hasData) {
                              return Container(width: size, height: size);
                            }
                            return Container(
                                alignment: Alignment.center,
                                width: size,
                                child: CustomPaint(
                                  size: Size.square(280),
                                  painter: QrPainter(
                                    data: controller.uniqueID,
                                    version: QrVersions.auto,
                                    //color: Colors.black,
                                    gapless: true,
                                    eyeStyle: const QrEyeStyle(
                                      eyeShape: QrEyeShape.square,
                                      color: Color(0xff503caa),
                                    ),
                                    dataModuleStyle: const QrDataModuleStyle(
                                      dataModuleShape: QrDataModuleShape.square,
                                      color: Color(0xff543cb5),
                                    ),
                                    // size: 320.0,
                                    embeddedImage: snapshot.data,
                                    embeddedImageStyle: QrEmbeddedImageStyle(
                                      size: Size.square(60),
                                      color:Colors.transparent
                                    ),
                                  ),
                                )
                            );
                          }
                        ),

                        Center(
                          child: GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              height: 60.0,
                              width: Get.width*0.65,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 20
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60.0),
                                color:Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.refresh,
                                    size: 30.0,
                                    color: AppColor.appColor,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text('Refresh QR code',
                                    style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),

            Expanded(child: Container()),
          ],
        ),
      )
    );
  }
}
  