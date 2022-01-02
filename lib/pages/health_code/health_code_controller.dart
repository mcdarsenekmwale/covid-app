import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HealthCodeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }
  
  final uniqueID = 's9dkrc3nk2387uj6pe93k7zd6g8czgxk9sjqjxxajvca84w777468mjzsyfgex7a';
  Future<ui.Image>  loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/images/covid_1.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

}
