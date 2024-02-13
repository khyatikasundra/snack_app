import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/string/menu_screen_strings.dart';
import 'package:snacks_ordering_app/widgets/background_container.dart';
import 'package:snacks_ordering_app/widgets/custom_app_bar.dart';
import 'package:snacks_ordering_app/widgets/custom_category_card.dart';
import 'package:snacks_ordering_app/widgets/custom_popular_now_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Map<String, String> categoryItems = {
    "pizza": "assets/svg_image/pizza.svg",
    "burger": "assets/svg_image/burger.svg",
    "popcorn": "assets/svg_image/popcorn.svg",
    "burger1": "assets/svg_image/burger.svg",
  };
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    List<String> menuItemNameList = categoryItems.keys.toList();
    List<String> menuItemImageList = categoryItems.values.toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      body: BackgroundContainer(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: LayoutBuilder(
                builder: (context, constraints) => CustomScrollView(
                      scrollDirection: Axis.vertical,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _richTextTitle(),
                              spacer(),
                              _catagoriesSection(
                                  menuItemNameList, menuItemImageList),
                              _popularNowTitleSection(),
                            ],
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width > 400
                                  ? 40
                                  : 20),
                          sliver: SliverGrid.builder(
                              itemCount: 5,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10,
                                      childAspectRatio:
                                          MediaQuery.of(context).size.width >
                                                  400
                                              ? 1 / 0.5
                                              : 1 / 1,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) =>
                                  const CustomPopularNowCard()),
                        ),
                      ],
                    )),
          ),
        ),
      ),
    );
  }

//?WIDGET METHODS
  PreferredSize _appBar() => const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: CustomAppBar(
          leadingAssetName: "assets/icons/icon_option.svg",
          trailingEnable: true,
          trailingIcon: Icon(Icons.mic_none),
          middleTitleLocationTextEnable: true,
        ),
      );

  Widget _richTextTitle() => Container(
        margin: const EdgeInsets.only(top: 26),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: MenuScreenStrings.getYourFood,
              style: Theme.of(context).textTheme.displaySmall),
          TextSpan(
              text: MenuScreenStrings.delivered,
              style: Theme.of(context).textTheme.displayLarge),
        ])),
      );

  Widget spacer({double? height = 20}) => SizedBox(
        height: height,
      );

  Widget _catagoriesSection(List menuItemNameList, List menuItemImageList) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MenuScreenStrings.catagories,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _categoriesListBuilder(menuItemNameList, menuItemImageList)
        ],
      );

  Widget _categoriesListBuilder(
          List menuItemNameList, List menuItemImageList) =>
      SizedBox(
        height: 150,
        child: ListView.builder(
            itemCount: categoryItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return CustomCategoryCard(
                categoryCardImage: menuItemImageList[index],
                categoryCardText: menuItemNameList[index],
              );
            }),
      );

  Widget _popularNowTitleSection() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            MenuScreenStrings.popularNow,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _customSwitch()
        ],
      );

  Widget _customSwitch() => Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Switch(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            thumbIcon: MaterialStateProperty.all(const Icon(Icons.star)),
            activeColor: const Color(0xFfFECE00),
            value: _switchValue,
            onChanged: (value) => setState(() {
                  _switchValue = value;
                })),
      );
}
