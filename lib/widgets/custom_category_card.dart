import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/menu_screen_strings.dart';

class CustomCategoryCard extends StatefulWidget {
  final String? categoryCardImage;
  final String? categoryCardText;
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
  String _assetName = AssetNameString.rightArrowYellowIconAssetName;
  bool _isClickContainer = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: _isClickContainer ? boxShadow() : null,
        ),
        child: _cardContainer(),
      ),
    );
  }

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
        ? AssetNameString.rightArrowWhiteIconAssetName
        : AssetNameString.rightArrowYellowIconAssetName;
    _isClickContainer = !_isClickContainer;
    setState(() {});
  }

  void iconOnPressFunction() => FocusScope.of(context).requestFocus(_focusNode);

  //?WIDGET METHOD
  Widget _cardContainer() => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_focusNode),
        child: Card(
          color: _surfaceTintColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: SizedBox(
            width: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(widget.categoryCardImage ??
                    AssetNameString.pizzaSvgImageAssertName),
                Text(
                  widget.categoryCardText ?? MenuScreenStrings.pizza,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                IconButton(
                  onPressed: iconOnPressFunction,
                  icon: SvgPicture.asset(_assetName),
                )
              ],
            ),
          ),
        ),
      );

  List<BoxShadow>? boxShadow() => [
        BoxShadow(
          color: Colors.white.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 10,
        )
      ];
}
