
class CaseModel{
  String id;
  String country;
  String countryCode;
  String city;
  String cityCode;
  String latitude;
  String longitude;
  int confirmed;
  int deaths;
  int recovered;
  int active;
  DateTime dateTime;

CaseModel({
    this.id,
  this.country,
  this.countryCode,
  this.city,
  this.confirmed,
  this.deaths,
  this.recovered,
  this.active,
  this.latitude,
  this.longitude,
  this.dateTime
}){
  this.deaths = deaths??0;
  this.recovered = recovered ?? 0;
  this.active = active??0;
  this.confirmed = confirmed??0;
}

  CaseModel.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    city = json['City'];
    confirmed = json['Confirmed'];
    deaths = json['Deaths'];
    recovered = json['Recovered'];
    active = json['Active'];
    latitude = json['Lat'];
    longitude = json['Lon'];
    dateTime = DateTime.parse(json['Date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['active'] = this.active;
    data['recovered'] = this.recovered;
    data['date'] = this.dateTime.millisecondsSinceEpoch;
    return data;
  }
}