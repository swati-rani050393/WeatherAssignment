import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_assignment/providers/weather_provider.dart';
import 'package:weather_assignment/ui/forecast_screen.dart';
import 'package:weather_assignment/ui/home_page.dart';
import 'package:weather_assignment/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (_) => WeatherProvider()),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'Weather App',
    initialRoute: '/',
    routes: {
    '/': (context) => HomePage(),
    '/forecast': (context) => ForecastScreen(),
    },
    ),
    );


  }
}

