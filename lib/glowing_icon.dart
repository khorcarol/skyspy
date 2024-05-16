import 'package:flutter/material.dart';

class GlowingIcon extends StatelessWidget {
  final IconData icon;

  const GlowingIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Colors.white, size: 36.0, shadows: <Shadow>[
      const Shadow(color: Color.fromRGBO(255, 255, 255, 0.5), blurRadius: 5.0)
    ]);
  }
}
