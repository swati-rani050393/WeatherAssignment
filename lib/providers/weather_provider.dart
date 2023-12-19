import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/weather.dart';



class WeatherProvider extends ChangeNotifier {
  List<Weather> _forecast = [];
  List<Weather> get forecast => _forecast;

  bool _loading = false;
  bool get loading => _loading;

  String error = '';

  Future<void> getWeatherForecast(String city) async {
    _loading = true;
    notifyListeners();

    const String apiKey = '81f4615be96cde13786c130996d2df0a';
    const String apiUrl = 'https://api.openweathermap.org/data/2.5/forecast';
    final String requestUrl = '$apiUrl?q=$city&appid=$apiKey';

    try {
      final http.Response response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['list'];
        _forecast = data.
        where((item) => item['dt_txt'].toString().contains('12:00:00'))
            .map((item) => Weather(
          date: item['dt_txt'],
          temperature: item['main']['temp'].toDouble(),
          weatherCondition: item['weather'][0]['description'],
        ))
            .toList();
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
