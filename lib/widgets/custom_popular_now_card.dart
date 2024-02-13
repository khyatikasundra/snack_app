import 'package:flutter/material.dart';

class CustomPopularNowCard extends StatelessWidget {
  final double? positionedBottom;
  final double? positionedTop;
  final double? positionedRight;
  final double? positionedLeft;
  const CustomPopularNowCard(
      {this.positionedBottom,
      this.positionedLeft,
      this.positionedRight,
      this.positionedTop,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width > 400 ? 300 : 170,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Margherita Pizza"),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          child: Image.asset(
            "assets/images/pizza_picture.png",
            width: 120,
          ),
        )
      ],
    );
  }
}
