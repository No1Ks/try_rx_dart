part of '../playground.dart';

class _ZipView extends StatelessWidget {
  const _ZipView({required this.dimension});

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Zip'),
        const SizedBox(width: 10),
        StreamBuilder<(IconData, Color)>(
          stream: ZipStream.zip2(
            IconsSource.stream(),
            ColorsSource.stream(),
            (IconData icon, Color color) => (icon, color),
          ),
          builder: (context, data) {
            return Column(
              children: [
                _IconWidget(data.data?.$1, dimension: dimension),
                const SizedBox(height: 10),
                _ColorWidget(data.data?.$2, dimension: dimension),
              ],
            );
          },
        ),
      ],
    );
  }
}
