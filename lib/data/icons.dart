import 'package:flutter/material.dart';

class IconsSource {
  static const _icons = [
    Icons.looks_one_rounded,
    Icons.looks_two_rounded,
    Icons.looks_3_rounded,
    Icons.looks_4_rounded,
    Icons.looks_5_rounded,
    Icons.looks_6_rounded,
    Icons.check_box_rounded,
  ];

  static Stream<IconData> stream() async* {
    int i = 0;
    while (true) {
      yield _icons[i];

      await Future.delayed(const Duration(milliseconds: 500));
      i = i < _icons.length - 1 ? i + 1 : 0;
    }
  }
}
