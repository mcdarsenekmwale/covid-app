import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:covid_app/global_widgets/carousel/carousel_header.dart';
import 'package:covid_app/global_widgets/covid_test_card.dart';
import 'package:covid_app/global_widgets/covid_vaccine_card.dart';
import 'package:covid_app/global_widgets/prevention/prevention_section.dart';

import 'home_controller.dart';

class HomeView extends  GetView<HomeController>  {
  const HomeView({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CarouselHeader(),
              PreventionSection(),
              SizedBox(
                height: Get.height*0.34,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal:3.0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    CovidTestCard(),
                    CovidVaccineCard()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
  