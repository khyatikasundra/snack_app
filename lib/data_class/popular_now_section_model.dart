import 'package:snacks_ordering_app/data_class/category_section_model.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/string_names.dart';

class PopularNowSectionModel {
  final String? imageAssetName;
  final String? itemNameText;
  final String? itemSpecialtyText;
  final ItemCategorization itemCategorization;

  PopularNowSectionModel(
      {this.imageAssetName,
      this.itemNameText,
      this.itemSpecialtyText,
      required this.itemCategorization});
}

List<PopularNowSectionModel> popularNowItem = [
  PopularNowSectionModel(
      imageAssetName: AssetNameString.pizzaImageAssetName,
      itemNameText: StringNames.margheritaPizza,
      itemSpecialtyText: StringNames.cheesyPizza,
      itemCategorization: ItemCategorization.pizza),
  PopularNowSectionModel(
      imageAssetName: AssetNameString.hamburgerImageAssetName,
      itemNameText: StringNames.hamburger,
      itemSpecialtyText: StringNames.doublePatty,
      itemCategorization: ItemCategorization.burger),
  PopularNowSectionModel(
      imageAssetName: AssetNameString.hamburgerImageAssetName,
      itemNameText: StringNames.hamburger,
      itemSpecialtyText: StringNames.doublePatty,
      itemCategorization: ItemCategorization.burger),
  PopularNowSectionModel(
      imageAssetName: AssetNameString.pizzaImageAssetName,
      itemNameText: StringNames.margheritaPizza,
      itemSpecialtyText: StringNames.cheesyPizza,
      itemCategorization: ItemCategorization.pizza),
  PopularNowSectionModel(
      imageAssetName: AssetNameString.pizzaImageAssetName,
      itemNameText: StringNames.margheritaPizza,
      itemSpecialtyText: StringNames.cheesyPizza,
      itemCategorization: ItemCategorization.pizza),
  PopularNowSectionModel(
      imageAssetName: AssetNameString.hamburgerImageAssetName,
      itemNameText: StringNames.hamburger,
      itemSpecialtyText: StringNames.doublePatty,
      itemCategorization: ItemCategorization.burger),
];
