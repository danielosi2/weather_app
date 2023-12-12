import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/add_info.dart';
import 'package:weather_app/forecast_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
      body: Padding(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300 ° C',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.cloud, size: 64),
                          SizedBox(height: 16),
                          Text('Rain', style: TextStyle(fontSize: 20))
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
              'Weather Forecast',
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AddInfoItem(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  text: '94',
                ),
                AddInfoItem(
                  icon: Icons.air,
                  label: 'wind Speed',
                  text: '7.67',
                ),
                AddInfoItem(
                  icon: Icons.beach_access,
                  label: 'pressure',
                  text: '1006',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
