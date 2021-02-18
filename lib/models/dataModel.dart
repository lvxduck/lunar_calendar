
class Data{
  List<Month> months;
  Data.fromJson(Map<String, dynamic> json){
    this.months = List<Month>.from(json['data'].map((month) => Month.fromJson(month)));
  }
}

class Month{
  int month;
  List<Date> dates;
  Month.fromJson(Map<String, dynamic> json){
    this.month = json['month'];
    this.dates = List<Date>.from(json['day'].map((date) => Date.fromJson(date)));
  }
}

class Date{
  String solarDay;
  String solarDate;
  String lunarDate;
  String lunarDetail1;
  String lunarDetail2;
  List<String> lunarDetail;
  List<dynamic> details;
  // LuckyHours luckyHours;
  Date.fromJson(Map<String, dynamic> json){
    this.solarDay = json['solarDay'];
    this.solarDate = json['solarDate'];
    this.lunarDate = json['lunarDate'];
    this.lunarDetail = List<String>.from(json['lunarDetail']);
    this.details = json['details'];
    this.lunarDetail1 = json['lunarDetail1'];
    this.lunarDetail2 = json['lunarDetail2'];
  }
}
