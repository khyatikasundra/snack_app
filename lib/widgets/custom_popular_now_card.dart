import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/data_class/popular_now_section_model.dart';
import 'package:snacks_ordering_app/screen/check_out_screen.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/string_names.dart';
import 'package:snacks_ordering_app/widgets/image_bottom_shadow.dart';
import 'package:snacks_ordering_app/widgets/svg_image.dart';

class CustomPopularNowCard extends StatelessWidget {
  final bool isGridView;
  final int index;
  final List<PopularNowSectionModel> list;

  const CustomPopularNowCard({
    required this.list,
    required this.index,
    this.isGridView = true,
    super.key,
  });

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
                        list[index].itemNameText ??
                            StringNames.kMargheritaPizza,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            list[index].itemSpecialtyText ??
                                StringNames.cheesyPizza,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SvgImage(AssetNameString.fireIconAssetName)
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
          top: isGridView ? -6 : 0,
          left: isGridView ? null : 0,
          child: ImageBottomShadow(
            child: InkWell(
              onTap: () => onTap(context),
              child: Image.asset(
                list[index].imageAssetName ??
                    AssetNameString.pizzaImageAssetName,
                width: 130,
              ),
            ),
          ),
        )
      ],
    );
  }
}
