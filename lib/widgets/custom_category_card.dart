import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/data_class/category_section_model.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/string_names.dart';
import 'package:snacks_ordering_app/widgets/svg_image.dart';

class CustomCategoryCard extends StatelessWidget {
  final int index;
  final VoidCallback? onCardClick;
  final Color surfaceTint;
  final Color iconBackgroundColor;
  final VoidCallback? onIconClick;

  const CustomCategoryCard(
      {required this.index,
      super.key,
      this.onCardClick,
      this.iconBackgroundColor = Colors.white,
      this.surfaceTint = const Color(0xFfFECE00),
      this.onIconClick});

  final bool _isClickContainer = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: _isClickContainer ? boxShadow() : null,
        ),
        child: _cardContainer(context),
      ),
    );
  }

  Widget _cardContainer(BuildContext context) => GestureDetector(
        onTap: onCardClick,
        child: Card(
          color: surfaceTint,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: SizedBox(
            width: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgImage(categoryItem[index].imageAssetName ??
                    AssetNameString.pizzaSvgImageAssertName),
                const SizedBox(height: 3),
                Text(
                  categoryItem[index].itemNameText ?? StringNames.pizza,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 3),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: SvgImage(AssetNameString.rightArrowIconAssetName),
                    onPressed: onIconClick,
                  ),
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
