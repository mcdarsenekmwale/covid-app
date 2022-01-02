import 'package:covid_app/pages/home/home_controller.dart';
import 'package:covid_app/pages/home/home_view.dart';
import 'package:covid_app/pages/profile/profile_controller.dart';
import 'package:covid_app/pages/profile/profile_view.dart';
import 'package:covid_app/pages/reports/reports_controller.dart';
import 'package:covid_app/pages/reports/reports_view.dart';
import 'package:covid_app/pages/statistics/statistics_controller.dart';
import 'package:covid_app/pages/statistics/statistics_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainServices extends GetxService with GetxServiceMixin{

  var selectedIndex = 0.obs;
  final PageStorageBucket pageStorageBucket = new PageStorageBucket();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //page keys
  static const Key pHome_key = PageStorageKey('pHome');
  static const Key pStatistics_key = PageStorageKey('pStatistics');
  static const Key pReports_key = PageStorageKey('pReports');
  static const Key pProfile_key = PageStorageKey('pProfile');

  static const List<Widget> _mainPages = [
    HomeView(key: pHome_key,),
    StatisticsView(key: pStatistics_key,),
    ReportsView(key: pReports_key,),
    ProfileView(key: pProfile_key)
  ];

  var firstPage = _mainPages.first.obs;

  @override
  void onInit() {
    super.onInit();
    onBottomNavigate(selectedIndex.value);
  }

  //
  onBottomNavigate(int index){
      selectedIndex.value = index;
      switch(index){
        case 0:
          Get.lazyPut<HomeController>(() =>HomeController());
          break;
        case 1:
          Get.lazyPut<StatisticsController>(() =>StatisticsController());
          break;
        case 2:
          Get.lazyPut<ReportsController>(() =>ReportsController());
          break;
        case 2:
          Get.lazyPut<ProfileController>(() =>ProfileController());
          break;
        default:
          break;
      }
      firstPage.value = _mainPages[selectedIndex.value];
  }

  //change pag
  onDrawerOpen(){
    scaffoldKey.currentState.openDrawer();
  }
}


