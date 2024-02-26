import 'package:snacks_ordering_app/string/assets_string.dart';

class SizeModel {
  final String assertName;
  bool isSelected;
  SizeModel({required this.assertName, this.isSelected = false});
}

List<SizeModel> sizesList = [
  SizeModel(assertName: AssetNameString.sLetterIcon),
  SizeModel(assertName: AssetNameString.mLetterIcon),
  SizeModel(assertName: AssetNameString.lLetterIcon),
];
