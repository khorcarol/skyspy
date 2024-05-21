import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class AppSettings extends ChangeNotifier {
  bool _redMode = false;
  bool get redMode => _redMode;
  set redMode(bool value) {
    if (_redMode != value) {
      _redMode = value;
      notifyListeners();
    }
  }

  void toggleRedMode() {
    _redMode = !_redMode;
    notifyListeners();
  }
}

class WeatherData extends ChangeNotifier {
  String key = "e43370b37615967700311d81c1fbc5e4";
  late WeatherFactory ws;
  Weather? data;
  DateTime? now;
  String dateString = "...";
  int stargazingIndex = 0;

  WeatherData() {
    ws = WeatherFactory(key);
    queryWeather();
  }
  
  void queryWeather() async {
    data = await ws.currentWeatherByLocation(52.1951, 0.1313); // TODO: change coords
    now = DateTime.now();
    dateString = "${now?.day}/${now?.month}/${now?.year}";
    stargazingIndex = (100 / data!.cloudiness!).toInt();
    notifyListeners();
  }
}
