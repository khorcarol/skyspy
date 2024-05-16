import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyspy/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(50, 42, 104, 1),
              Color.fromRGBO(123, 85, 150, 1),
              Color.fromRGBO(180, 126, 136, 1),
              Color.fromRGBO(180, 126, 136, 1),
            ]
          )),
        child: Stack(children: [
          const FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Image(image: AssetImage('images/combined.png'), fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: Center(
              child: Column(children: [
                const Text(
                  'stargazing suitability',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Consumer<WeatherData>(
                  builder: (context, weather, child) => Text(
                    weather.data?.tempMax?.celsius?.toInt().toString() ?? "...",
                    style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      fontSize: 70,
                    )
                  )
                )
              ])
            )
          ),
        ]),
      ),
    );
  }
}
