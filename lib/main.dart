import 'package:flutter/material.dart';
import 'package:try_rx_dart/playground.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  static const text = 'Try RxDart';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: text,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const Playground(title: text),
    );
  }
}
