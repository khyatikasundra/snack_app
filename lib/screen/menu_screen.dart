import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/data_class/category_section_data_class.dart';
import 'package:snacks_ordering_app/data_class/popular_now_section_data_class.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/menu_screen_strings.dart';
import 'package:snacks_ordering_app/widgets/background_container.dart';
import 'package:snacks_ordering_app/widgets/custom_app_bar.dart';
import 'package:snacks_ordering_app/widgets/custom_category_card.dart';
import 'package:snacks_ordering_app/widgets/custom_popular_now_card.dart';
import 'package:snacks_ordering_app/widgets/custom_scaffold.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<PopularNowSectionDataClass> popularNowItem = [
    PopularNowSectionDataClass(
        imageAssetName: AssetNameString.pizzaImageAssetName,
        itemNameText: MenuScreenStrings.margheritaPizza,
        itemSpecialtyText: MenuScreenStrings.cheesyPizza),
    PopularNowSectionDataClass(
        imageAssetName: AssetNameString.hamburgerImageAssetName,
        itemNameText: MenuScreenStrings.hamburger,
        itemSpecialtyText: MenuScreenStrings.doublePatty),
    PopularNowSectionDataClass(
        imageAssetName: AssetNameString.hamburgerImageAssetName,
        itemNameText: MenuScreenStrings.hamburger,
        itemSpecialtyText: MenuScreenStrings.doublePatty),
    PopularNowSectionDataClass(
        imageAssetName: AssetNameString.pizzaImageAssetName,
        itemNameText: MenuScreenStrings.margheritaPizza,
        itemSpecialtyText: MenuScreenStrings.cheesyPizza),
    PopularNowSectionDataClass(
        imageAssetName: AssetNameString.pizzaImageAssetName,
        itemNameText: MenuScreenStrings.margheritaPizza,
        itemSpecialtyText: MenuScreenStrings.cheesyPizza),
    PopularNowSectionDataClass(
        imageAssetName: AssetNameString.hamburgerImageAssetName,
        itemNameText: MenuScreenStrings.hamburger,
        itemSpecialtyText: MenuScreenStrings.doublePatty),
  ];

  List<CategorySectionDataClass> categoryItem = [
    CategorySectionDataClass(
        imageAssetName: AssetNameString.pizzaSvgImageAssertName,
        itemNameText: MenuScreenStrings.pizza),
    CategorySectionDataClass(
        imageAssetName: AssetNameString.burgerSvgImageAssertName,
        itemNameText: MenuScreenStrings.burger),
    CategorySectionDataClass(
        imageAssetName: AssetNameString.popcornSvgImageAssertName,
        itemNameText: MenuScreenStrings.popcorn),
    CategorySectionDataClass(
        imageAssetName: AssetNameString.pizzaSvgImageAssertName,
        itemNameText: MenuScreenStrings.pizza),
    CategorySectionDataClass(
        imageAssetName: AssetNameString.burgerSvgImageAssertName,
        itemNameText: MenuScreenStrings.burger),
    CategorySectionDataClass(
        imageAssetName: AssetNameString.popcornSvgImageAssertName,
        itemNameText: MenuScreenStrings.popcorn),
  ];
  bool _switchValue = false;
  bool _isGridViewVisible = true;
  bool _isListViewVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: _appBar(),
      body: BackgroundContainer(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _richTextTitle(),
                      spacer(),
                      _catagoriesSection(),
                      _popularNowTitleSection(),
                    ],
                  ),
                ),
                _sliverGridView(),
                _sliverListView()
              ],
            ),
          ),
        ),
      ),
    );
  }

//?WIDGET METHODS
  PreferredSize _appBar() => PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CustomAppBar(
          leadingAssetName: AssetNameString.optionIconAssetName,
          trailingEnable: true,
          trailingIcon: const Icon(Icons.mic_none),
          middleTitleLocationTextEnable: true,
        ),
      );

  Widget _richTextTitle() => Container(
        margin: const EdgeInsets.only(top: 26),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
            text: MenuScreenStrings.getYourFood,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          TextSpan(
            text: MenuScreenStrings.delivered,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ])),
      );

  Widget spacer({double? height = 20}) => SizedBox(
        height: height,
      );

  Widget _catagoriesSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MenuScreenStrings.catagories,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _categoriesListBuilder()
        ],
      );

  Widget _categoriesListBuilder() => SizedBox(
        height: 160,
        child: ListView.builder(
            itemCount: categoryItem.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomCategoryCard(
                  categoryCardImage: categoryItem[index].imageAssetName,
                  categoryCardText: categoryItem[index].itemNameText,
                ),
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
          onChanged: (value) => _onChangeSwitchFunction(value),
        ),
      );

  void _onChangeSwitchFunction(bool value) {
    _switchValue = value;
    _isGridViewVisible = !_switchValue;
    _isListViewVisible = _switchValue;
    setState(() {});
  }

  SliverVisibility _sliverGridView() => SliverVisibility(
        visible: _isGridViewVisible,
        sliver: SliverPadding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width > 400 ? 40 : 20),
          sliver: SliverGrid.builder(
              itemCount: popularNowItem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width > 400
                      ? 1 / 0.5
                      : 1 / 1.3,
                  crossAxisCount: 2),
              itemBuilder: (context, index) =>
                  _customPopularNowCardForGrid(index)),
        ),
      );

  CustomPopularNowCard _customPopularNowCardForGrid(int index) =>
      CustomPopularNowCard(
        imageAssetName: popularNowItem[index].imageAssetName,
        itemNameText: popularNowItem[index].itemNameText,
        itemSpecialtyText: popularNowItem[index].itemSpecialtyText,
      );

  SliverVisibility _sliverListView() => SliverVisibility(
        visible: _isListViewVisible,
        sliver: SliverPadding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width > 400 ? 150 : 15,
              left: MediaQuery.of(context).size.width > 400 ? 150 : 0),
          sliver: SliverList.builder(
            itemCount: popularNowItem.length,
            itemBuilder: (context, index) =>
                _customPopularNowCardForList(index),
          ),
        ),
      );

  CustomPopularNowCard _customPopularNowCardForList(int index) =>
      CustomPopularNowCard(
        cardHeight: 120,
        cardWidth:
            MediaQuery.of(context).size.width > 400 ? 400 : double.infinity,
        alignment: Alignment.centerLeft,
        cardImagePositionedLeft: -10,
        cardHeadlineTopPadding: 0,
        cardHeadlineLeftPadding: 40,
        cardTopPadding: 0,
        imageAssetName: popularNowItem[index].imageAssetName,
        itemNameText: popularNowItem[index].itemNameText,
        itemSpecialtyText: popularNowItem[index].itemSpecialtyText,
      );
}
