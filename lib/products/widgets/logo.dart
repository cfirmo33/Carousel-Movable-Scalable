import 'package:flutter/material.dart';

class LogoWedget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        'S',
        style: TextStyle(
            color: Colors.orange, fontSize: 26, fontWeight: FontWeight.w900),
      ),
      Text(
        'tore.',
        style: TextStyle(
            color: Colors.black, fontSize: 26, fontWeight: FontWeight.w900),
      ),
    ]);
  }
}
