import 'package:flutter/material.dart';

class HoursBar extends StatelessWidget {
  const HoursBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      child: Align(
        alignment: const Alignment(-0.7, -0.65),
        child: FractionallySizedBox(
          heightFactor: 0.07,
          widthFactor: 1,
          child: Container(
            color: const Color.fromARGB(255, 65, 65, 96),
            alignment: Alignment.center,
            child: const FittedBox(
              fit: BoxFit.fill,
              child: Text('    19   20   21   22   23   0   1   2   3   4   5   6   7    ')
            )
          )
        ),
      ),
    );
  }
}