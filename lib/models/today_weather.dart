class TodayWeather {
  final double maxtemp;
  final double mintemp;
  final double avgtemp;
  final String statue;
  final String city;

  TodayWeather(
      {required this.city,
      required this.statue,
      required this.maxtemp,
      required this.mintemp,
      required this.avgtemp});
  factory TodayWeather.fromJson(json) {
    return TodayWeather(
        city: json['address'],
        statue: json['days'][0]['conditions'],
        maxtemp: json['days'][0]['tempmax'],
        mintemp: json['days'][0]['tempmin'],
        avgtemp: json['days'][0]['temp']);
  }
}
