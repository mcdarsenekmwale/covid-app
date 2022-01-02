import 'dart:async';
import 'dart:io';
import 'package:covid_app/pages/app_web_viewer/widgets/botton_sheet_item.dart';
import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:share_plus/share_plus.dart';

class AppWebViewerController extends GetxController {

  final Completer<WebViewController> webController =
  Completer<WebViewController>();
  var _args = Get.arguments;
  var title = ''.obs;
  var url = ''.obs;
  var loading =  false.obs;
  @override
  void onInit() {
    super.onInit();
    getTitle();
    url.value = _args;
    if (Platform.isAndroid)
      WebView.platform = SurfaceAndroidWebView();
  }

  void goBack() async {
    final controller = await webController.future;
    if (await controller.canGoBack ()) {
      await controller.goBack();
    } else {
      Get.back();
    }
  }

  //
  getTitle()async {
    final controller = await webController.future;
    title.value = await controller.getTitle();
  }

  //
  JavascriptChannel toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Get.snackbar(
              '', message.message
          );
        });
  }

  //open bottom sheet
getBottomSheet() async{
    try{
      final _controller = await webController.future;
      Get.bottomSheet(
        Container(
          width: Get.width,
          height: Get.width*0.75,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          BottomSheetItem(
                            icon: Icons.refresh,
                            text: 'Refresh',
                            onTab: (){
                              if(!webController.isCompleted)
                                return null;
                              else
                                _controller.reload();
                              Get.back();
                            },
                          ),
                          BottomSheetItem(
                            icon: Icons.copy_outlined,
                            text: 'Copy link',
                            onTab: () async{
                              final url = await _controller.currentUrl();
                              Clipboard.setData(new ClipboardData(text: url.toString()));
                              Get.back();
                              messageDisplay(
                                text: 'Link Copied'
                              );
                            },
                          ),
                          BottomSheetItem(
                            icon: Icons.report_problem_outlined,
                            text: 'Report',
                            onTab: (){
                              Get.back();
                              messageDisplay(
                                  text: 'Reported'
                              );
                            },
                          ),
                          BottomSheetItem(
                            icon: FontAwesomeIcons.share,
                            text: 'Share',
                            onTab: ()async{
                              final url = await _controller.currentUrl();
                              Get.back();
                              _onShareLink(
                                url: url
                              );
                            },
                          ),
                          BottomSheetItem(
                            icon: Icons.open_in_browser,
                            text: 'Open with Browser',
                            onTab: () async{
                              Get.back();
                              final url = await _controller.currentUrl();
                              await _launchInBrowser(url);
                            },
                          ),
                          BottomSheetItem(
                            icon: Icons.settings,
                            text: 'Browser Settings',
                            onTab: (){
                              Get.back();
                            },
                          )
                        ],
                      )
                    ],
                  )
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8.0)
                          )
                        ),
                        primary: AppColor.appColor,
                        padding: EdgeInsets.symmetric(
                          vertical: 13.0
                        )
                      ),
                        onPressed: (){
                          Get.back();
                        }, child: Text('Cancel',
                          style: TextStyle(
                              color: Get.theme.scaffoldBackgroundColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                            fontFamily: 'Poppins'
                          ),
                        ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        elevation: 1.0,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0)
          )
        )
      );
    }
    catch(error){
      throw new Exception(error);
    }
}

//open with browser
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
        enableJavaScript: true
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  _onShareLink({String url}) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final RenderBox box = Get.context.findRenderObject() as RenderBox;

    if (url.isNotEmpty) {
      await Share.share(url,
          subject: 'Shared From Covid-APP ',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }
}
