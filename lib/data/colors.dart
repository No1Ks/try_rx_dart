import 'package:flutter/material.dart';

class ColorsSource {
  static const _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.lightBlueAccent,
    Colors.blue,
    Colors.purple,
  ];

  static Stream<Color> stream() async* {
    int i = 0;
    while (true) {
      yield _colors[i];

      await Future.delayed(const Duration(milliseconds: 200));
      i = i < _colors.length - 1 ? i + 1 : 0;
    }
  }
}
