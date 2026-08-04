import 'package:flutter/material.dart';
import 'package:riverpod_code/apis/models/weather_model.dart';
import 'package:riverpod_code/apis/services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController cityController = TextEditingController();
 
  final WeatherService weatherService = WeatherService();

  WeatherModel? weather;
  bool isLoading = false;

  Future<void> getWeather() async {
    if (cityController.text.trim().isEmpty) return;

    setState(() {
      isLoading = true;
    });

    weather = await weatherService.getWeather(cityController.text.trim());

    setState(() {
      isLoading = false;
    });
  }

 

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather API")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: "Enter City",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: getWeather,
                child: const Text("Search"),
              ),
            ),

            const SizedBox(height: 30),

            if (isLoading) const CircularProgressIndicator(),

            if (weather != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        weather!.location!.name!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(weather!.location!.country!),

                      const SizedBox(height: 10),

                      Text(
                        "${weather!.current!.tempC} °C",
                        style: const TextStyle(fontSize: 22),
                      ),

                      Text(weather!.current!.condition!.text!),

                      const SizedBox(height: 10),

                      Text("Humidity : ${weather!.current!.humidity}%"),

                      Text("Wind : ${weather!.current!.windKph} km/h"),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
