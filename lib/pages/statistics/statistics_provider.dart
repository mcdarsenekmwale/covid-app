
import 'package:covid_app/models/case_model.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class  StatisticsProvider extends GetConnect{

  Location _currentLocation = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  void onInit() {
    super.onInit();
    this._getLocationDetails();
  }

  _setPermissions() async{
    _serviceEnabled = await _currentLocation.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _currentLocation.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await _currentLocation.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _currentLocation.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  //
_getLocationDetails() async{
    this._setPermissions();
    _locationData =  await _currentLocation.getLocation();
    if (_locationData != null) {
      final lat = _locationData.latitude;
      final lon = _locationData.longitude;
      return {lat, lon};
    }
    else
      return {};

}

//
Future getCaseDetails({String country}) async{
    try{
      Response response = await get('https://api.covid19api.com/live/country/$country');

      if(response.hasError)
        return Future.error(response.status.code);
      else if (response.isOk)
        return response.body.map((json)=>CaseModel.fromJson(json)).toList();
    }
    catch(error){
      print(error);
    }
}
}