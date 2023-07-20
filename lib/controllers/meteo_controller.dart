import 'package:flutter/material.dart';

import '../models/meteo_model.dart';
import '../util/constants.dart';

class MeteoController extends ChangeNotifier {
  double percent = 0.0;
  List<MeteoModel> weatherList = [];
  int messageIndex = 0;
  int counter = 0;
  String message = '';
  bool loading = false;

  get getPercent => percent;
  get getWeatherList => weatherList;
  get getMessageIndex => messageIndex;
  get getCounter => counter;
  get getMessage => messages[messageIndex];
  get getPercentString => (percent * 100).toStringAsFixed(0);
  bool get isLoading => loading;

  set setWeatherList(List<MeteoModel> value) {
    weatherList = value;
    notifyListeners();
  }

  set setMessageIndex(int value) {
    messageIndex = value;
    notifyListeners();
    setMessage = messages[messageIndex];
    notifyListeners();
  }

  set setCounter(int value) {
    counter = value;
    notifyListeners();
  }

  set setPercent(double value) {
    percent = value;
    notifyListeners();
  }

  set setMessage(String value) {
    message = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void reset() {
    setPercent = 0.00;
    setWeatherList = [];
    setMessageIndex = 0;
    setCounter = 0;
    setLoading(false);
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void incrementPercent() {
    setPercent = double.parse((percent + 0.01).toStringAsFixed(2));
  }

  void addWeatherList(MeteoModel value) {
    weatherList.add(value);
    notifyListeners();
  }

  void incrementMessageIndex(int value) {
    messageIndex += value;
    notifyListeners();
    setMessage = messages[messageIndex];
    notifyListeners();
  }

}
