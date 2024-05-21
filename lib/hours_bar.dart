import 'package:flutter/material.dart';

class HoursBar extends StatelessWidget {
  const HoursBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
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
              child: Wrap(
                spacing: 11,
                children: [
                  Text(''),
                  Text('19'),
                  Text('20'),
                  Text('21'),
                  Text('22'),
                  Text('23'),
                  Text('0 '),
                  Text('1 '),
                  Text('2 '),
                  Text('3 '),
                  Text('4 '),
                  Text('5 '),
                  Text('6 '),
                  Text(''),
                ],
              )
            )
          )
        ),
      ),
    );
  }
}
