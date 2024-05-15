import 'package:flutter/material.dart';

class GlowingIcon extends StatelessWidget {
  final IconData icon;

  const GlowingIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.white,
      shadows: <Shadow>[
        const Shadow(color: Colors.white, blurRadius: 15.0)
      ]
    );
  }
}
