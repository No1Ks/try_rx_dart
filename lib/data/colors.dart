import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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

  ///
  /// SUBJECT
  ///

  static final _subject = ReplaySubject<Color>();

  static Stream<Color> get subjectStream => _subject.stream;

  static int _index = 0;

  static final _timer = Timer.periodic(
    const Duration(milliseconds: 500),
    (_) {
      _subject.add(_colors[_index]);
      _index = _index < _colors.length - 1 ? _index + 1 : 0;
    },
  );

  static void startTimer() => _timer; // static kick

  static void killTimer() => _timer.cancel();
}
