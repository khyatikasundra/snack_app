import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/data_class/popular_now_section_model.dart';
import 'package:snacks_ordering_app/screen/check_out_screen/check_out_page.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/string_names.dart';
import 'package:snacks_ordering_app/widgets/image_bottom_shadow.dart';
import 'package:snacks_ordering_app/widgets/svg_image.dart';

class CustomPopularNowCard extends StatefulWidget {
  final bool isGridView;
  final int index;
  final List<PopularNowSectionModel> list;

  const CustomPopularNowCard({
    required this.list,
    required this.index,
    this.isGridView = true,
    super.key,
  });

  @override
  State<CustomPopularNowCard> createState() => _CustomPopularNowCardState();
}

class _CustomPopularNowCardState extends State<CustomPopularNowCard> {
  void _onTap(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => const CheckOutPage()));

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [_cardView(), _imageView()],
    );
  }

  Widget _cardView() => Padding(
        padding: EdgeInsets.only(top: widget.isGridView ? 50 : 0),
        child: GestureDetector(
          onTap: () => _onTap(context),
          child: _card(),
        ),
      );

  Widget _card() => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: SizedBox(
          child: Padding(
            padding: _cardPadding(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_menuTitleName(), _menuDescriptionText()],
            ),
          ),
        ),
      );

  EdgeInsets _cardPadding() {
    return EdgeInsets.only(
      top: widget.isGridView ? 30 : 30,
      left: widget.isGridView ? 0 : 40,
      bottom: widget.isGridView ? 0 : 40,
    );
  }

  Text _menuTitleName() => Text(
        widget.list[widget.index].itemNameText ?? StringNames.margheritaPizza,
        style: Theme.of(context).textTheme.headlineMedium,
      );

  Widget _menuDescriptionText() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.list[widget.index].itemSpecialtyText ??
                StringNames.cheesyPizza,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SvgImage(AssetNameString.fireIconAssetName)
        ],
      );

  Positioned _imageView() {
    return Positioned(
      top: widget.isGridView ? -6 : 0,
      left: widget.isGridView ? null : 0,
      child: ImageBottomShadow(
        child: GestureDetector(
          onTap: () => _onTap(context),
          child: Image.asset(
            widget.list[widget.index].imageAssetName ??
                AssetNameString.pizzaImageAssetName,
            width: 130,
          ),
        ),
      ),
    );
  }
}
