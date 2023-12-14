import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/add_info.dart';
import 'package:weather_app/forecast_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrete_key.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'Lagos';
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$Apikey',
        ),
      );
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw 'An unexpected error occured';
      }
      return data;

      // temp = data['list'][0]['main']['temp'];
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather app'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!;
          final currentWeatherData = data['list'][0];
          final currentTemp = currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final pressure = currentWeatherData['main']['pressure'];
          final windSpeed = currentWeatherData['wind']['speed'];
          final humidity = currentWeatherData['main']['humidity'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '$currentTemp ° C',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(currentSky == 'Clouds' || currentSky == 'Rain' ? Icons.cloud : Icons.sunny, size: 64),
                              const SizedBox(height: 16),
                              Text('$currentSky', style: const TextStyle(fontSize: 20))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //weatherforecast panel
                const Text(
                  'Hourly Forecast',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ForeCastItem(
                        icon: Icons.cloud,
                        time: '00:00',
                        text: '200',
                      ),
                      ForeCastItem(
                        icon: Icons.sunny,
                        time: '03:00',
                        text: '270',
                      ),
                      ForeCastItem(
                        icon: Icons.cloud,
                        time: '06:00',
                        text: '210',
                      ),
                      ForeCastItem(
                        icon: Icons.sunny,
                        time: '09:00',
                        text: '260',
                      ),
                      ForeCastItem(
                        icon: Icons.cloud,
                        time: '00:00',
                        text: '200',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Additional Information',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AddInfoItem(
                      icon: Icons.water_drop,
                      label: 'Humidity',
                      text: humidity.toString(),
                    ),
                    AddInfoItem(
                      icon: Icons.air,
                      label: 'wind Speed',
                      text: windSpeed.toString(),
                    ),
                    AddInfoItem(
                      icon: Icons.beach_access,
                      label: 'pressure',
                      text: pressure.toString(),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
