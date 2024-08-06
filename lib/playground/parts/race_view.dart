part of '../playground.dart';

class _RaceView extends StatefulWidget {
  const _RaceView({required this.dimension});

  final double dimension;

  @override
  State<_RaceView> createState() => _RaceViewState();
}

class _RaceViewState extends State<_RaceView> {
  @override
  Widget build(BuildContext context) {
    final rand = Random();
    final iconsSkip = rand.nextInt(10);
    final colorsSkip = rand.nextInt(10);

    return Row(
      children: [
        const Text('Race. To retry ->'),
        GestureDetector(
          onTap: () => setState(() {}),
          child: const Icon(Icons.change_circle),
        ),
        Text(' iconsSkip = $iconsSkip, colorsSkip = $colorsSkip'),
        const SizedBox(width: 10),
        StreamBuilder<Widget>(
          stream: RaceStream<Widget>(
            [
              IconsSource.stream()
                  .map<Widget>((e) => _IconWidget(e, dimension: widget.dimension))
                  .skip(iconsSkip),
              ColorsSource.stream()
                  .map<Widget>((e) => _ColorWidget(e, dimension: widget.dimension))
                  .skip(colorsSkip),
            ],
          ),
          builder: (context, data) => data.data ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
