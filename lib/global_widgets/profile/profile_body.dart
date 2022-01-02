import 'package:get/get.dart';
import 'package:covid_app/global_widgets/profile/profile_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
        child: Column(
          children: <Widget>[
            ProfileTile(
              icon: Icons.account_circle,
              title: "My Account",
              onTap: () {  },
            ),
            ProfileTile(
                icon: Icons.local_hospital,
              title: "Health Status",
              onTap: () {  },
            ),
            ProfileTile(
                icon: Icons.sms,
                title: "Messages",
              onTap: () {
                  Get.toNamed('/messages');
              },
            ),
            ProfileTile(
              icon: Icons.location_on,
              title: "Location",
              onTap: () {
               // Get.toNamed('/messages');
              },
            ),
            ProfileTile(
                icon: Icons.settings,
                title: "Settings",
              onTap: () {  },
            ),
          ],
        )
    );
  }
}
