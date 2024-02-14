import 'package:flutter/material.dart';

class ImageBottomShadow extends StatelessWidget {
  final Widget child;
  final Color shadowColor;
  final double spreadRadius;
  final double blurRadius;
  final Offset offset;

  const ImageBottomShadow({
    Key? key,
    required this.child,
    this.shadowColor = Colors.black,
    this.spreadRadius = 20,
    this.blurRadius = 40,
    this.offset = const Offset(50, 40),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned.fill(
          top: 105,
          bottom: 6, // Adjust as needed
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipOval(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withOpacity(0.4),
                      spreadRadius: spreadRadius,
                      blurRadius: blurRadius,
                      offset: offset,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
