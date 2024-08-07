part of '../playground.dart';

class _SubjectView extends StatefulWidget {
  const _SubjectView({required this.dimension});

  final double dimension;

  @override
  State<_SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<_SubjectView> {
  final firstPack = <Widget>[];
  final secondPack = <Widget>[];

  late final StreamSubscription firstPackSub;
  late final StreamSubscription secondPackSub;

  static const _itemsLength = 6;

  void _packListener(List<Widget> pack, Color color) {
    if (pack.length > _itemsLength) pack.clear();

    setState(() => pack.add(_ColorWidget(color, dimension: widget.dimension)));
  }

  @override
  void initState() {
    firstPackSub = ColorsSource.subjectStream.listen((e) => _packListener(firstPack, e));

    Future.delayed(
      const Duration(seconds: 2),
      () => secondPackSub = ColorsSource.subjectStream.listen((e) => _packListener(secondPack, e)),
    );

    super.initState();
  }

  @override
  void dispose() {
    firstPackSub.cancel();
    secondPackSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Subject'),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [const Text('1 pack: '), ...firstPack]),
            Row(children: [const Text('2 pack: '), ...secondPack]),
          ],
        ),
      ],
    );
  }
}
