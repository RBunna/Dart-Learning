import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: weatherData
                  .map(
                    (weather) => WeatherCard(
                      city: weather.city,
                      minTemp: weather.minTemp,
                      maxTemp: weather.maxTemp,
                      currentTemp: weather.currentTemp,
                      gradientColors: weather.gradientColors,
                      weatherStatus: weather.weatherStatus,
                    ),
                  )
                  .toList(), 
            ),
          ),
        ),
      ),
    );
  }
}

enum WeatherStatus { cloudy, sunny, sunnyCloud, veryCloudy }

class Weather {
  final String city;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final LinearGradient gradientColors;
  final WeatherStatus weatherStatus;

  const Weather({
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.gradientColors,
    required this.weatherStatus,
  });
}

class WeatherCard extends StatelessWidget {
  final String city;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final Gradient gradientColors;
  final WeatherStatus weatherStatus;

  const WeatherCard({
    super.key,
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.gradientColors,
    this.weatherStatus = WeatherStatus.cloudy,
  });

  AssetImage getWeatherImage() {
    switch (weatherStatus) {
      case WeatherStatus.cloudy:
        return const AssetImage('cloudy.png'); 
      case WeatherStatus.sunny:
        return const AssetImage('sunny.png'); 
      case WeatherStatus.sunnyCloud:
        return const AssetImage('sunnyCloud.png'); 
      case WeatherStatus.veryCloudy:
        return const AssetImage('veryCloudy.png'); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 6,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black12,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: gradientColors,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned(
                top: -20,
                right: -50,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: gradientColors.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 32 + 8,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: getWeatherImage(),
                          child: Icon(
                            weatherStatus == WeatherStatus.sunny
                                ? Icons.wb_sunny
                                : Icons.cloud,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              city,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Min ${minTemp.toStringAsFixed(1)}°C",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Max ${maxTemp.toStringAsFixed(1)}°C",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "${currentTemp.toStringAsFixed(1)}°C",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//AI generate Data
final List<Weather> weatherData = [
  Weather(
    city: 'Phnom Penh',
    minTemp: 26,
    maxTemp: 34,
    currentTemp: 31,
    gradientColors: const LinearGradient(
      colors: [Colors.orange, Colors.yellow],
    ),
    weatherStatus: WeatherStatus.sunny,
  ),
  Weather(
    city: 'Tokyo',
    minTemp: 18,
    maxTemp: 25,
    currentTemp: 22,
    gradientColors: const LinearGradient(
      colors: [Colors.blueGrey, Colors.lightBlueAccent],
    ),
    weatherStatus: WeatherStatus.veryCloudy,
  ),
  Weather(
    city: 'New York',
    minTemp: 10,
    maxTemp: 18,
    currentTemp: 15,
    gradientColors: const LinearGradient(colors: [Colors.indigo, Colors.cyan]),
    weatherStatus: WeatherStatus.cloudy,
  ),
  Weather(
    city: 'Bangkok',
    minTemp: 27,
    maxTemp: 35,
    currentTemp: 33,
    gradientColors: const LinearGradient(
      colors: [Colors.pinkAccent, Colors.deepOrangeAccent],
    ),
    weatherStatus: WeatherStatus.sunny,
  ),
  Weather(
    city: 'Seoul',
    minTemp: 14,
    maxTemp: 22,
    currentTemp: 18,
    gradientColors: const LinearGradient(
      colors: [Colors.blue, Colors.lightBlueAccent],
    ),
    weatherStatus: WeatherStatus.cloudy,
  ),
  Weather(
    city: 'London',
    minTemp: 9,
    maxTemp: 16,
    currentTemp: 13,
    gradientColors: const LinearGradient(
      colors: [Colors.grey, Colors.blueGrey],
    ),
    weatherStatus: WeatherStatus.veryCloudy,
  ),
  Weather(
    city: 'Sydney',
    minTemp: 20,
    maxTemp: 28,
    currentTemp: 25,
    gradientColors: const LinearGradient(
      colors: [Colors.cyan, Colors.lightGreenAccent],
    ),
    weatherStatus: WeatherStatus.sunnyCloud,
  ),
  Weather(
    city: 'Paris',
    minTemp: 11,
    maxTemp: 19,
    currentTemp: 16,
    gradientColors: const LinearGradient(
      colors: [Colors.purpleAccent, Colors.deepPurple],
    ),
    weatherStatus: WeatherStatus.cloudy,
  ),
  Weather(
    city: 'Dubai',
    minTemp: 29,
    maxTemp: 41,
    currentTemp: 38,
    gradientColors: const LinearGradient(
      colors: [Colors.deepOrange, Colors.amber],
    ),
    weatherStatus: WeatherStatus.sunny,
  ),
  Weather(
    city: 'Toronto',
    minTemp: 4,
    maxTemp: 12,
    currentTemp: 9,
    gradientColors: const LinearGradient(
      colors: [Colors.lightBlue, Colors.blueAccent],
    ),
    weatherStatus: WeatherStatus.sunnyCloud,
  ),
];
