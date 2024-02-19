import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snacks_ordering_app/screen/check_out_screen.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/menu_screen_strings.dart';
import 'package:snacks_ordering_app/widgets/image_bottom_shadow.dart';

class CustomPopularNowCard extends StatelessWidget {
  // final double? cardImagePositionedTop;
  final double? cardImagePositionedLeft;
  final String? imageAssetName;
  final String? itemNameText;
  final String? itemSpecialtyText;
  final bool isGridView;

  const CustomPopularNowCard(
      {this.cardImagePositionedLeft,
      // this.cardImagePositionedTop = -6,
      this.imageAssetName,
      this.itemNameText,
      this.itemSpecialtyText,
      this.isGridView = true,
      super.key});

  void onTap(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => const CheckOutScreen()));

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        InkWell(
          onTap: () => onTap(context),
          child: Padding(
            padding: EdgeInsets.only(top: isGridView ? 50 : 0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: isGridView ? 30 : 30,
                    left: isGridView ? 0 : 40,
                    bottom: isGridView ? 0 : 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        itemNameText ?? MenuScreenStrings.margheritaPizza,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            itemSpecialtyText ?? MenuScreenStrings.cheesyPizza,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SvgPicture.asset(AssetNameString.fireIconAssetName)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: isGridView ? -6:0,
          left: isGridView ? null:0,
          child: ImageBottomShadow(
            child: InkWell(
              onTap: () => onTap(context),
              child: Image.asset(
                imageAssetName ?? AssetNameString.pizzaImageAssetName,
                width: 130,
              ),
            ),
          ),
        )
      ],
    );
  }
}
