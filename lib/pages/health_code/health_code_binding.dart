import 'package:get/get.dart';

import 'health_code_controller.dart';

class HealthCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthCodeController>(() => HealthCodeController());
  }
}
