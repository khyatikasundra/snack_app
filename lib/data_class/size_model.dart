import 'package:snacks_ordering_app/string/assets_string.dart';

class SizeModel {
  final String assertName;
  SizeModel({required this.assertName});
}

List<SizeModel> sizesList = [
  SizeModel(assertName: AssetNameString.sLetterIcon),
  SizeModel(assertName: AssetNameString.mLetterIcon),
  SizeModel(assertName: AssetNameString.lLetterIcon),
];
