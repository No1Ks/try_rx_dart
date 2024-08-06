import 'package:flutter/material.dart';
import 'package:try_rx_dart/data/colors.dart';
import 'package:try_rx_dart/data/icons.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<Color>(
                  stream: ColorSource.stream(),
                  builder: (context, color) {
                    return Container(
                      decoration: BoxDecoration(
                        color: color.data,
                        shape: BoxShape.circle,
                      ),
                      width: dimension,
                      height: dimension,
                    );
                  },
                ),
                const SizedBox(width: 10),
                StreamBuilder<IconData>(
                  stream: IconsSource.stream(),
                  builder: (context, icon) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        shape: BoxShape.circle,
                      ),
                      width: dimension,
                      height: dimension,
                      child: Icon(icon.data),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
