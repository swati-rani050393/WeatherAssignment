
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      backgroundColor: Colors.lightGreen,
      body:Center(
        child:Padding(
        padding: EdgeInsets.all(20.0),
        child:Container(
        width: 400,
          height: 300,
          decoration: BoxDecoration(color: Colors.white,shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(12)),
          child:Column(
          children: [
            Padding(padding: EdgeInsets.all(25.0),
           child: TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                hintText: 'City Name',
              ),
            ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final provider =
                Provider.of<WeatherProvider>(context, listen: false);
                provider.getWeatherForecast(_cityController.text);
                Navigator.pushNamed(context, '/forecast');
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      ),
      ),
    );
  }
}
