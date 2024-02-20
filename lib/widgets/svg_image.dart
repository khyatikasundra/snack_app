import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SvgImage extends StatelessWidget {
  final String assertName;
  const SvgImage(this.assertName, {super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assertName);
  }
}
