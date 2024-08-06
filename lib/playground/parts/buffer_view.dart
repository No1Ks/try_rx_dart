part of '../playground.dart';

class _BufferView extends StatelessWidget {
  const _BufferView({required this.dimension});

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Buffer'),
        const SizedBox(width: 10),
        StreamBuilder<List<Widget>>(
          stream: MergeStream<Widget>(
            [
              IconsSource.stream().map<Widget>((e) => _IconWidget(e, dimension: dimension)),
              ColorsSource.stream().map<Widget>((e) => _ColorWidget(e, dimension: dimension)),
            ],
          ).bufferCount(7),
          builder: (context, data) {
            return Row(
              children: [
                for (final w in data.data ?? [])
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: w,
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}
