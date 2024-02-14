import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snacks_ordering_app/screen/check_out_screen.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/menu_screen_strings.dart';
import 'package:snacks_ordering_app/widgets/image_bottom_shadow.dart';

class CustomPopularNowCard extends StatelessWidget {
  final double? cardImagePositionedTop;
  final double? cardImagePositionedLeft;
  final AlignmentGeometry alignment;
  final double cardTopPadding;
  final double? cardHeight;
  final double? cardWidth;
  final double cardHeadlineTopPadding;
  final double cardHeadlineLeftPadding;
  final String? imageAssetName;
  final String? itemNameText;
  final String? itemSpecialtyText;

  const CustomPopularNowCard(
      {this.cardImagePositionedLeft,
      this.cardHeadlineLeftPadding = 0,
      this.cardImagePositionedTop = -6,
      this.alignment = Alignment.topCenter,
      this.cardTopPadding = 50,
      this.cardHeight = 170,
      this.cardWidth,
      this.cardHeadlineTopPadding = 30,
      this.imageAssetName,
      this.itemNameText,
      this.itemSpecialtyText,
      super.key});

  void onTap(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => const CheckOutScreen()));

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [_customCard(context), _floatingImageOnTopCenter(context)],
    );
  }

  Widget _floatingImageOnTopCenter(BuildContext context) => Positioned(
        top: cardImagePositionedTop,
        left: cardImagePositionedLeft,
        child: ImageBottomShadow(
          child: InkWell(onTap: () => onTap(context),
            child: Image.asset(
              imageAssetName ?? AssetNameString.pizzaImageAssetName,
              width: 130,
            ),
          ),
        ),
      );

  Widget _customCard(BuildContext context) => InkWell(
        onTap: () => onTap(context),
        child: Padding(
          padding: EdgeInsets.only(top: cardTopPadding),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: SizedBox(
              height: cardHeight,
              width: cardWidth,
              child: _customCardContent(context),
            ),
          ),
        ),
      );

  Widget _customCardContent(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            top: cardHeadlineTopPadding, left: cardHeadlineLeftPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              itemNameText ?? MenuScreenStrings.margheritaPizza,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            _customCardContentSubHeading(context)
          ],
        ),
      );

  Widget _customCardContentSubHeading(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            itemSpecialtyText ?? MenuScreenStrings.cheesyPizza,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SvgPicture.asset(AssetNameString.fireIconAssetName)
        ],
      );
}
