import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/data_class/size_model.dart';
import 'package:snacks_ordering_app/widgets/svg_image.dart';

class CustomContainerSizesButton extends StatelessWidget {
  final VoidCallback? onIconClick;
  final Color? color;
  final int index;
  const CustomContainerSizesButton(
      {this.onIconClick,
      this.color = Colors.white,
      this.index = 0,
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
            onPressed: onIconClick,
            icon: SvgImage(sizesList[index].assertName),
          )),
    );
  }
}
