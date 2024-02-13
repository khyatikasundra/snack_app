import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget? child;
  const BackgroundContainer({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/dark_background.png"), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
