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
  int stargazingIndex = 0;

  WeatherData() {
    ws = WeatherFactory(key);
    queryWeather();
  }
  
  void queryWeather() async {
    data = await ws.currentWeatherByLocation(55, 0); // TODO: change coords
    stargazingIndex = (100 / data!.cloudiness!).toInt();
    notifyListeners();
  }
}
