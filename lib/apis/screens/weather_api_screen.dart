import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_code/apis/models/weather_model.dart';

class WeatherApiScreen extends StatefulWidget {
  const WeatherApiScreen({super.key});

  @override
  State<WeatherApiScreen> createState() => _WeatherApiScreenState();
}

class _WeatherApiScreenState extends State<WeatherApiScreen> {
  List<WeatherModel> weatherList = [];
  Future<List<WeatherModel>> getWeatherAPI () async {
    final response = await http.get(Uri.parse());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather API')),
     body : 
    );
  }
}