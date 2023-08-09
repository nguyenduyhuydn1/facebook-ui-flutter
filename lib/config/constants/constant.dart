import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.black,
  Colors.blue,
  Colors.pink,
  Colors.amber,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Color.fromARGB(245, 47, 167, 167)
];

const primaryColor = Color(0xFF0C9869);
const textColor = Color(0xFF3C4046);
const backgroundColor = Color(0xFFF9F8FD);

class Palette {
  static const Color scaffold = Color(0xFFF0F2F5);

  static const Color facebookBlue = Color(0xFF1777F2);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
