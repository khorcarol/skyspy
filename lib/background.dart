import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(0, 0, 0, 1),
            Color.fromRGBO(50, 42, 104, 1),
            Color.fromRGBO(123, 85, 150, 1)
          ]
        )),
      );
  }
}