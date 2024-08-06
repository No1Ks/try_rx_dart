import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:try_rx_dart/data/colors.dart';
import 'package:try_rx_dart/data/icons.dart';

part 'parts/buffer_view.dart';
part 'parts/items.dart';
part 'parts/map_merge_view.dart';
part 'parts/plain_view.dart';
part 'parts/race_view.dart';
part 'parts/zip_view.dart';

class Playground extends StatefulWidget {
  const Playground({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  static const dimension = 50.0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Divider(),
            _PlainView(dimension: dimension),
            _Divider(),
            _ZipView(dimension: dimension),
            _Divider(),
            _MapMergeView(dimension: dimension),
            _Divider(),
            _BufferView(dimension: dimension),
            _Divider(),
            _RaceView(dimension: dimension),
            _Divider(),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      height: 30,
    );
  }
}
