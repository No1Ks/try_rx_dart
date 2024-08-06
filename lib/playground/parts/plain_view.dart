part of '../playground.dart';

class _PlainView extends StatelessWidget {
  const _PlainView({required this.dimension});

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Plain'),
        const SizedBox(width: 10),
        StreamBuilder<Color>(
          stream: ColorsSource.stream(),
          builder: (context, color) => _ColorWidget(
            color.data,
            dimension: dimension,
          ),
        ),
        const SizedBox(width: 10),
        StreamBuilder<IconData>(
          stream: IconsSource.stream(),
          builder: (context, icon) => _IconWidget(
            icon.data,
            dimension: dimension,
          ),
        ),
      ],
    );
  }
}
