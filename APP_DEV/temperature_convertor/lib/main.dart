import 'package:flutter/material.dart';

void main() => runApp(const TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Temperature Converter',
      home: TemperatureConverterScreen(),
    );
  }
}

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  _TemperatureConverterScreenState createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  double celsius = 0;
  double fahrenheit = 0;

  void convertTemperature(double input, String unit) {
    setState(() {
      if (unit == 'Celsius') {
        celsius = input;
        fahrenheit = (input * 9 / 5) + 32;
      } else {
        fahrenheit = input;
        celsius = (input - 32) * 5 / 9;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  convertTemperature(double.parse(value), 'Celsius');
                }
              },
              decoration: const InputDecoration(
                labelText: 'Enter Celsius',
                suffixText: '°C',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  convertTemperature(double.parse(value), 'Fahrenheit');
                }
              },
              decoration: const InputDecoration(
                labelText: 'Enter Fahrenheit',
                suffixText: '°F',
              ),
            ),
            const SizedBox(height: 16.0),
            Text('Celsius: $celsius°C'),
            Text('Fahrenheit: $fahrenheit°F'),
          ],
        ),
      ),
    );
  }
}
