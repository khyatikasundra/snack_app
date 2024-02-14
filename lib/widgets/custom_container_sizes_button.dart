import 'package:flutter/material.dart';

class CustomContainerSizesButton extends StatefulWidget {
  final Widget? icon;
  final VoidCallback? onPressIconEvent;
  final FocusNode? focusNode;
  const CustomContainerSizesButton(
      {this.icon, this.onPressIconEvent, this.focusNode, super.key});

  @override
  State<CustomContainerSizesButton> createState() =>
      _CustomContainerSizesButtonState();
}

class _CustomContainerSizesButtonState
    extends State<CustomContainerSizesButton> {
  final FocusNode _focusNode = FocusNode();
  Color? color = Colors.white;
  @override
  void initState() {
    _focusNode.addListener(onPress);
    super.initState();
  }

  void onPress() {
    color = _focusNode.hasFocus ? const Color(0xFFFECE00) : Colors.white;
    setState(() {});
  }

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
              FocusScope.of(context).requestFocus(_focusNode);
              widget.onPressIconEvent;
            },
            icon: widget.icon ?? const Icon(Icons.question_mark),
          )),
    );
  }
}
