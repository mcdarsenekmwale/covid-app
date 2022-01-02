import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notifications_controller.dart';

class NotificationsView extends  GetView<NotificationsController>  {
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
          IconButton(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(Icons.more_vert,
              color: Get.theme.scaffoldBackgroundColor,

            ),
            iconSize: 28.0,
            onPressed: ()async{

            },
          ),
        ],
        toolbarHeight: kToolbarHeight+ 2.0,
        backgroundColor: Get.theme.primaryColor,
        title: Text('Notifications',
          style: TextStyle(
              fontSize: 19.0,
             fontFamily: 'Poppins',

          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
  