import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:covid_app/utils/app_colors.dart';
import 'package:covid_app/utils/app_constants.dart';
import 'package:covid_app/global_widgets/profile/profile_body.dart';
import 'package:covid_app/global_widgets/profile/profile_header.dart';
import 'profile_controller.dart';

class ProfileView extends  GetView<ProfileController>  {
  const ProfileView({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppConstant.appHeight,
        width: AppConstant.appWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  AppColor.secondaryBtnColor.withOpacity(0.5),
                  AppColor.appColor,
                  AppColor.appColor,

                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProfileHeader(),
              ProfileBody()

            ],
          ),
        ),
      ),
    );
  }
}
  