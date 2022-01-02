import '../pages/app_web_viewer/app_web_viewer_view.dart';
import '../pages/app_web_viewer/app_web_viewer_binding.dart';
import '../pages/health_code/health_code_view.dart';
import '../pages/health_code/health_code_binding.dart';
import '../pages/notifications/notifications_view.dart';
import '../pages/notifications/notifications_binding.dart';
import '../pages/messages/messages_view.dart';
import '../pages/messages/messages_binding.dart';
import '../pages/main/main_view.dart';
import '../pages/statistics/statistics_view.dart';
import '../pages/statistics/statistics_binding.dart';
import '../pages/reports/reports_view.dart';
import '../pages/reports/reports_binding.dart';
import '../pages/profile/profile_view.dart';
import '../pages/profile/profile_binding.dart';
import '../pages/home/home_view.dart';
import '../pages/home/home_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(),
      binding: HomeBinding(),
      transition: Transition.leftToRight
    ),
    GetPage(
      name: Routes.PROFILE, 
      page:()=> ProfileView(), 
      binding: ProfileBinding(),
        transition: Transition.leftToRight
    ),
    GetPage(
      name: Routes.REPORTS, 
      page:()=> ReportsView(), 
      binding: ReportsBinding(),
        transition: Transition.leftToRight
    ),
    GetPage(
      name: Routes.STATISTICS, 
      page:()=> StatisticsView(), 
      binding: StatisticsBinding(),
        transition: Transition.leftToRight
    ),
    GetPage(
      name: Routes.MAIN,
      page:()=> MainView(),
        transition: Transition.leftToRight
    ),
    GetPage(
      name: Routes.MESSAGES, 
      page:()=> MessagesView(), 
      binding: MessagesBinding(),
        transition: Transition.leftToRight
    ),
    GetPage(
      name: Routes.NOTIFICATIONS, 
      page:()=> NotificationsView(), 
      binding: NotificationsBinding(),
        transition: Transition.leftToRight
    ),
    GetPage(
      name: Routes.HEALTH_CODE, 
      page:()=> HealthCodeView(), 
      binding: HealthCodeBinding(),
        transition: Transition.leftToRight
    ),
    GetPage(
      name: Routes.APP_WEB_VIEWER, 
      page:()=> AppWebViewerView(), 
      binding: AppWebViewerBinding(),
        transition: Transition.leftToRight
    ),
  ];
}