import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snacks_ordering_app/data_class/size_model.dart';

class CustomIconButtonOfSizes extends StatelessWidget {
  final VoidCallback? onIconClick;
  final Color? color;
  final int index;
  const CustomIconButtonOfSizes(
      {this.onIconClick, this.color = Colors.white, this.index = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(sizesList[index].isSelected
              ? const Color(0xFfFECE00)
              : Colors.white),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        ),
        onPressed: onIconClick,
        icon: SvgPicture.asset(
          sizesList[index].assertName,
        ));
  }
}
