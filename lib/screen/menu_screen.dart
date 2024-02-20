import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/data_class/category_section_model.dart';
import 'package:snacks_ordering_app/data_class/popular_now_section_model.dart';
import 'package:snacks_ordering_app/string/string_names.dart';
import 'package:snacks_ordering_app/widgets/background_container.dart';
import 'package:snacks_ordering_app/widgets/custom_category_card.dart';
import 'package:snacks_ordering_app/widgets/custom_popular_now_card.dart';
import 'package:snacks_ordering_app/widgets/custom_scaffold.dart';
import 'package:snacks_ordering_app/widgets/menu_screen_app_bar.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool _switchValue = false;
  int selectedIndex = -1;
  late List<PopularNowSectionModel> selectedItem;

  @override
  void initState() {
    selectedItem = popularNowItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const MenuScreenAppBar(),
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
                _switchValue ? _sliverListView() : _sliverGridView()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //?List

//?WIDGET METHODS

  Widget _richTextTitle() => Container(
        margin: const EdgeInsets.only(top: 26),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
            text: StringNames.getYourFood,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          TextSpan(
            text: StringNames.delivered,
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
            StringNames.catagories,
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
                child: _customCategoryCard(index),
              );
            }),
      );

  Widget _customCategoryCard(int index) => CustomCategoryCard(
        index: index,
        onCardClick: () {
          setState(() {
            selectedIndex = index;
          });
          selectedItem = popularNowItem
              .where((element) =>
                  categoryItem[index].itemCategorization ==
                  element.itemCategorization)
              .toList();
        },
        surfaceTint:
            selectedIndex == index ? const Color(0xFfFECE00) : Colors.white,
        iconBackgroundColor:
            selectedIndex == index ? Colors.white : const Color(0xFfFECE00),
        onIconClick: () {
          setState(() {
            selectedIndex = index;
          });
        },
      );

  Widget _popularNowTitleSection() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringNames.popularNow,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _customSwitch()
        ],
      );

  Widget _customSwitch() => Padding(
        padding: const EdgeInsets.only(right: 15),
        child: CupertinoSwitch(
          activeColor: const Color(0xFfFECE00),
          trackColor: Colors.grey,
          value: _switchValue,
          onChanged: (value) => _onChangeSwitchFunction(value),
        ),
      );

  void _onChangeSwitchFunction(bool value) {
    _switchValue = value;
    setState(() {});
  }

  SliverGrid _sliverGridView() => SliverGrid.builder(
      itemCount: selectedItem.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:
              MediaQuery.of(context).size.width > 400 ? 1 / 0.5 : 1 / 1.3,
          crossAxisCount: 2),
      itemBuilder: (context, index) => CustomPopularNowCard(
            index: index,
            list: selectedItem,
          ));

  SliverList _sliverListView() => SliverList.builder(
        itemCount: selectedItem.length,
        itemBuilder: (context, index) => CustomPopularNowCard(
          index: index,
          isGridView: false,
          list: selectedItem,
        ),
      );
}
