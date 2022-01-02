import 'package:get/get.dart';

import 'app_web_viewer_controller.dart';

class AppWebViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppWebViewerController>(() => AppWebViewerController());
  }
}
