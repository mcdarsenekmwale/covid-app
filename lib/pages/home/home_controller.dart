import 'package:get/get.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {

  Future<void> _launched;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  //open sms
  setSMS() async{
    try{
      // Android
      if(Platform.isAndroid){
        const uri = 'sms:+265 881 235 6487?body=hello%20there';
        if (await canLaunch(uri)) {
          await launch(uri);
        }
        else {
          print('Could not launch $uri');
        }
      }
      // iOS
     else if(Platform.isIOS) {
        const uri = 'sms:00265-881-235-6487?body=hello%20there';
        if (await canLaunch(uri)) {
          await launch(uri);
        } else {
          print('Could not launch $uri');
        }
      }
    }
    catch(error){
      throw new Exception(error);
    }
  }

  //make a call
makePhoneCall() async{
    try{
      final url = 'tel:+2658812356487';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    }
    catch(error){
      throw new Exception(error);
    }
}


}
