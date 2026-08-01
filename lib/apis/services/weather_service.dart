import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_code/apis/models/weather_model.dart';



class WeatherService {
  static const String _baseUrl = "api.weatherapi.com";
  static const String _apiKey = "d295f978e92146e18a9191555250210";

  Future<WeatherModel?> getWeather(String city) async {
    try {
      final uri = Uri.https(_baseUrl, "/v1/current.json", {
        "key": _apiKey,
        "q": city,
        "aqi": "no",
      });

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load weather");
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
