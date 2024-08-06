part of '../playground.dart';

class _MapMergeView extends StatelessWidget {
  const _MapMergeView({required this.dimension});

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Map + Merge'),
        const SizedBox(width: 10),
        StreamBuilder<String>(
          stream: MergeStream<String>(
            [
              IconsSource.stream().map<String>((e) => e.toString()),
              ColorsSource.stream().map<String>((e) => 'RGB(${e.red}, ${e.green}, ${e.blue})'),
            ],
          ),
          builder: (context, data) {
            return Column(
              children: [
                Text(data.data ?? 'no data'),
              ],
            );
          },
        ),
      ],
    );
  }
}
