import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyspy/app_state.dart';

class WidgetPage extends StatelessWidget {
  const WidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Image(
              image: AssetImage('images/widget_background.png'),
              fit: BoxFit.cover),
        ),
        const Positioned(
          top: 100,
          left: 50,
          child: InfoBox(
              icon: Icons.water_drop_rounded,
              title: 'rainfall',
              reading: "49%"),
        ),
        const Positioned(
          top: 240,
          right: 50,
          child: InfoBox(
            icon: Icons.visibility,
            title: 'transparency',
            reading: "26%",
          ),
        ),
        Positioned(
          top: 380,
          left: 50,
          child: InfoBox(
            icon: Icons.air,
            title: 'wind speed',
            reading: "${Provider.of<WeatherData>(context).data?.windSpeed?.toInt().toString() ?? "..."}m/s",
          ),
        ),
        Positioned(
          top: 520,
          right: 50,
          child: InfoBox(
            icon: Icons.opacity,
            title: 'humidity',
            reading: "${Provider.of<WeatherData>(context).data?.humidity?.toInt().toString() ?? "..."}%",
          ),
        ),
      ],
    );
  }
}

class InfoBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String reading;

  const InfoBox({
    super.key,
    required this.icon,
    required this.title,
    this.reading = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(137, 93, 146, 1)
            .withOpacity(0.5), // Semi-transparent background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (reading.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              reading,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
