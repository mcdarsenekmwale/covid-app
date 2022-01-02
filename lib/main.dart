import 'package:covid_app/routes/app_pages.dart';
import 'package:covid_app/services/main_services.dart';
import 'package:covid_app/services/messaging_services.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
  ).then((_) async{
    await initServices();
    runApp(new MainApp());
  }
  );
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //key: Get.key,
      debugShowCheckedModeBanner: false,
      title: 'Covid-19',
      theme: AppConstant.appTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder:  (context, widget){
        return StreamChat(
          streamChatThemeData: StreamChatThemeData.fromTheme(AppConstant.appTheme),
          child: widget,
          client: Get.find<MessagingServices>().client,
        );
      },
    );
  }
}

Future initServices() async {
  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<MainServices>(() => MainServices());
  await Get.putAsync(() => MessagingServices().init());

}
