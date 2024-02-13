import 'package:flutter/material.dart';

enum Direction {
  horizontal,
  vertical,
}

class CustomDirectionalWidget extends StatelessWidget {
  final Direction direction;
  final List<Widget> children;

  const CustomDirectionalWidget({
    Key? key,
    required this.direction,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return direction == Direction.horizontal
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );
  }
}
