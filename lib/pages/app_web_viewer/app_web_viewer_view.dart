import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'app_web_viewer_controller.dart';

class AppWebViewerView extends  GetView<AppWebViewerController>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(Icons.close,
            color: Get.theme.scaffoldBackgroundColor,
            size: 32,
          ),
          //iconSize: 28.0,
          onPressed: (){
            //controller.goBack();
            Get.back();
          },
        ),
        title: Obx(()=>Column(
          children: [
            Text('${controller.title}',
                style:TextStyle(
                    letterSpacing: 0.5,
                    fontFamily: 'Poppins',
                    color: Get.theme.scaffoldBackgroundColor,
                    fontSize: 17.0
                )
            ),
            Text('${controller.url.value}',
                style:TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white24,
                    fontSize: 8.0
                )
            ),
          ],
        ),
        ),
        actions: [
          //
          IconButton(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(Icons.more_vert,
              color: Get.theme.scaffoldBackgroundColor,
            ),
            iconSize: 28.0,
            onPressed: ()async{
              await controller.getBottomSheet();
            },
          ),
        ],
        toolbarHeight: kToolbarHeight+ 2.0,
        backgroundColor: Get.theme.primaryColor,
      ),
      body:  Builder(builder: (BuildContext context) {
        return Obx(()=>
            Column(
              children: [
                Visibility(
                  visible: controller.loading.value,
                  child: LinearProgressIndicator(
                    backgroundColor:Colors.white ,
                    valueColor: new AlwaysStoppedAnimation<Color>(AppColor.secondaryBtnColor),
                    minHeight: 1.6,
                  ),
                ),
                Expanded(
                  child: WebView(
                    initialUrl: controller.url.value,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) async {
                      controller.webController.complete(webViewController);
                      controller.title.value = await webViewController.getTitle();
                      controller.url.value = await webViewController.currentUrl();
                    },

                    javascriptChannels: <JavascriptChannel>[
                      controller.toasterJavascriptChannel(context),
                    ].toSet(),
                    navigationDelegate: (NavigationRequest request) {
                      if (request.url.startsWith('https://www.china.com/')) {

                        return NavigationDecision.prevent;
                      }
                      return NavigationDecision.navigate;
                    },
                    onPageStarted: (String url) {
                      controller.loading.value = true;
                    },
                    onPageFinished: (String url) async {
                      controller.loading.value = false;
                      controller.getTitle();
                    },
                    gestureNavigationEnabled: true,
                  ),
                ),
              ],
            ),
        );
      }),
    );
  }
}
  