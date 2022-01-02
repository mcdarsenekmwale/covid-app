import 'package:covid_app/models/case_model.dart';
import 'package:covid_app/pages/statistics/statistics_provider.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {


  var tabIndex = 0.obs;
  var caseModel = new CaseModel().obs;
  var cases = List.empty(growable: true).obs;
  var currentCategoryIndex = 0.obs;
  final _sProvider = StatisticsProvider();


  @override
  void onInit() async{
    super.onInit();
    updateList();
    _getCountryCovidStatistics();

  }
  onChangeTab(int index){
      tabIndex.value = index;

  }

  onChangeCategory(index){

      currentCategoryIndex.value = index;

      switch(index){
        case 0:
          _getTotalCases();
          break;
        case 1:
          caseModel.value = cases.first;
          updateList();
          break;
        case 2:
          caseModel.value = cases[1];
          updateList();
          break;

        default:
          break;
      }
  }



  //
_getCountryCovidStatistics() async{
    try{
        await _sProvider.getCaseDetails(country: 'Malawi')
            .then((value) async{
          if(value.isNotEmpty)
            cases.addAll(value);
          if(cases.isNotEmpty && cases.length >= 2)
            cases.sort(
                    (a,b)=>b.dateTime
                        .compareTo(a.dateTime)
            );
          await _getTotalCases();
        })
            .catchError((onError){
              print(onError);
        });
    }
    catch(error){
      throw new Exception(error);
    }
}

//
  var listOfStats =  List.empty(growable: true).obs;


//total
_getTotalCases () async{
    for( dynamic case_ in cases){
      caseModel.value.active += case_.active;
      caseModel.value.recovered += case_.recovered;
      caseModel.value.confirmed += case_.confirmed;
      caseModel.value.deaths += case_.deaths;
    }
    updateList();
}

updateList(){
  listOfStats.clear();
  listOfStats.add(caseModel.value.confirmed);
  listOfStats.add(caseModel.value.active);
  listOfStats.add(caseModel.value.recovered);
  listOfStats.add(caseModel.value.deaths);
}
}
