import 'package:flutter/material.dart';

class CustomContainerSizesButton extends StatelessWidget {
  final Widget? icon;
  final VoidCallback? onPressIconEvent;
  final FocusNode? focusNode;
  final Color? color;
  const CustomContainerSizesButton(
      {this.icon,
      this.onPressIconEvent,
      this.color = Colors.white,
      this.focusNode,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: IconButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(focusNode);
              onPressIconEvent;
            },
            icon: icon ?? const Icon(Icons.question_mark),
          )),
    );
  }
}
