import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/string_names.dart';

enum ItemCategorization { pizza, burger }

class CategorySectionModel {
  final String? imageAssetName;
  final String? itemNameText;
  final ItemCategorization itemCategorization;
  bool isSelected;
  CategorySectionModel(
      {this.imageAssetName,
      this.itemNameText,
      required this.itemCategorization,
      this.isSelected = false});
}

List<CategorySectionModel> categoryItem = [
  CategorySectionModel(
      imageAssetName: AssetNameString.pizzaSvgImageAssertName,
      itemNameText: StringNames.pizza,
      itemCategorization: ItemCategorization.pizza),
  CategorySectionModel(
      imageAssetName: AssetNameString.burgerSvgImageAssertName,
      itemNameText: StringNames.burger,
      itemCategorization: ItemCategorization.burger),
  CategorySectionModel(
      imageAssetName: AssetNameString.popcornSvgImageAssertName,
      itemNameText: StringNames.popcorn,
      itemCategorization: ItemCategorization.pizza),
  CategorySectionModel(
      imageAssetName: AssetNameString.pizzaSvgImageAssertName,
      itemNameText: StringNames.pizza,
      itemCategorization: ItemCategorization.pizza),
  CategorySectionModel(
      imageAssetName: AssetNameString.burgerSvgImageAssertName,
      itemNameText: StringNames.burger,
      itemCategorization: ItemCategorization.burger),
  CategorySectionModel(
      imageAssetName: AssetNameString.popcornSvgImageAssertName,
      itemNameText: StringNames.popcorn,
      itemCategorization: ItemCategorization.pizza),
];
