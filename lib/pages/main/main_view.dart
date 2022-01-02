import 'package:covid_app/global_widgets/app_botton_nav_bar.dart';
import 'package:covid_app/global_widgets/app_sidebar.dart';
import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:covid_app/global_widgets/app_header.dart';

import 'package:covid_app/services/main_services.dart';

class MainView extends  GetView<MainServices>  {
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: AppColor.appBgColor,
          appBar:AppHeader(onDrawerOpen:controller.onDrawerOpen , ),
          drawer: AppSideBar(),
          bottomNavigationBar: BottomAppBar(
            elevation: 10.0,
            color:AppColor.appBgColor2,
            shape: CircularNotchedRectangle(),
            notchMargin: 2,
            child: AppBottomNavBAr(
              onTap: controller.onBottomNavigate,
              index: controller.selectedIndex.value,
            ),
          ),
          body: PageStorage(bucket: controller.pageStorageBucket, child: controller.firstPage.value)
      ),
    );
  }
}
  