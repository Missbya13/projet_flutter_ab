class MeteoModel {
  final String cityName;
  final dynamic temperature;
  final dynamic humidity;
  final String icon;

  MeteoModel(
      {required this.cityName,
      required this.temperature,
      required this.humidity,
      required this.icon});

  factory MeteoModel.fromJson(Map<String, dynamic> json) {
    return MeteoModel(
      cityName: json['name'],
      temperature: json['main']['temp'],
      humidity: json['main']['humidity'],
      icon: json['weather'][0]['icon'],
    );
  }
}
