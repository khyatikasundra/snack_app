import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCategoryCard extends StatefulWidget {
  final String categoryCardImage;
  final String categoryCardText;
  const CustomCategoryCard(
      {required this.categoryCardImage,
      required this.categoryCardText,
      super.key});

  @override
  State<CustomCategoryCard> createState() => _CustomCategoryCardState();
}

class _CustomCategoryCardState extends State<CustomCategoryCard> {
  final FocusNode _focusNode = FocusNode();
  Color? _surfaceTintColor = Colors.white;
  String _assetName = "assets/icons/right_arrow_yellow_icon.svg";

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(onTap);
  }

  @override
  void dispose() {
    FocusNode().dispose();
    super.dispose();
  }

  void onTap() {
    _surfaceTintColor =
        _focusNode.hasFocus ? const Color(0xFfFECE00) : Colors.white;
    _assetName = _focusNode.hasFocus
        ? "assets/icons/right_arrow_white_icon.svg"
        : "assets/icons/right_arrow_yellow_icon.svg";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 50,
                offset: const Offset(0, 3))
          ],
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_focusNode);
          },
          child: Card(
            color: _surfaceTintColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: SizedBox(
              width: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(widget.categoryCardImage),
                  Text(
                    widget.categoryCardText,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(_assetName),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
