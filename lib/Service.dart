import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/SecondScrean.dart';

class WeatherApi {
  Future<Main> fetchWeather() async {
    Response response = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=874052e84d347c113b195247ec5518fa'));
    if (response.statusCode == 200) {
      return Main.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('failed to load Api');
    }
  }
}