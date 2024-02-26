import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snacks_ordering_app/data_class/category_section_model.dart';
import 'package:snacks_ordering_app/screen/menu_screen/bloc/menu_screen_bloc.dart';
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
  late MenuScreenBloc _menuScreenBloc;

  @override
  void initState() {
    _menuScreenBloc = context.read<MenuScreenBloc>();
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
                _gridOrListView()
              ],
            ),
          ),
        ),
      ),
    );
  }

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
        child: BlocBuilder<MenuScreenBloc, MenuScreenState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: categoryItem.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: _customCategoryCard(index),
                  );
                });
          },
        ),
      );

  Widget _customCategoryCard(int index) => CustomCategoryCard(
        index: index,
        onCardClick: () =>
            _menuScreenBloc.add(CategoryCardSelectedEvent(index: index)),
        onIconClick: () =>
            _menuScreenBloc.add(CategoryCardSelectedEvent(index: index)),
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
        child: BlocBuilder<MenuScreenBloc, MenuScreenState>(
          builder: (context, state) {
            return CupertinoSwitch(
              activeColor: const Color(0xFfFECE00),
              trackColor: Colors.grey,
              value: state is OnSwitchSelectionGridOrListViewState
                  ? state.value
                  : false,
              onChanged: _onSwitchSelectionGridORListView,
            );
          },
        ),
      );

  void _onSwitchSelectionGridORListView(bool value) {
    _menuScreenBloc.add(OnSwitchSelectionGridOrListViewEvent(value: value));
  }

  Widget _gridOrListView() => BlocBuilder<MenuScreenBloc, MenuScreenState>(
        builder: (context, state) =>
            (state is OnSwitchSelectionGridOrListViewState && state.value)
                ? _sliverListView()
                : _sliverGridView(),
      );

  Widget _sliverGridView() => SliverGrid.builder(
      itemCount: MenuScreenBloc.selectedItem.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:
              MediaQuery.of(context).size.width > 400 ? 1 / 0.5 : 1 / 1.3,
          crossAxisCount: 2),
      itemBuilder: (context, index) => CustomPopularNowCard(
            index: index,
            list: MenuScreenBloc.selectedItem,
          ));

  Widget _sliverListView() => SliverList.builder(
        itemCount: MenuScreenBloc.selectedItem.length,
        itemBuilder: (context, index) => CustomPopularNowCard(
          index: index,
          isGridView: false,
          list: MenuScreenBloc.selectedItem,
        ),
      );
}
