
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(' Weather of 5 days'),
      ),
      backgroundColor: Colors.lightGreen,
      body: provider.loading
          ? Center(child: CircularProgressIndicator())
          : provider.error.isNotEmpty
          ? Center(child: Text(provider.error))
          : ListView.builder(
        itemCount: provider.forecast.length,
        itemBuilder: (context, index) {
          final weather = provider.forecast[index];
          return Padding(
            padding: EdgeInsets.all(16),
          child:Card(
            elevation: 12,
            child:ListTile(
            title: Text(weather.date),
            subtitle: Text('${weather.weatherCondition}'),
              trailing:Text('${weather.temperature}°C') ,
          ),
          ),
            );
        },
      ),
    );
  }
}
