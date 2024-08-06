part of '../playground.dart';

class _IconWidget extends StatelessWidget {
  const _IconWidget(this.icon, {required this.dimension});

  final IconData? icon;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        shape: BoxShape.circle,
      ),
      width: dimension,
      height: dimension,
      child: Icon(icon),
    );
  }
}

class _ColorWidget extends StatelessWidget {
  const _ColorWidget(
    this.color, {
    required this.dimension,
  });

  final Color? color;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: dimension,
      height: dimension,
    );
  }
}
