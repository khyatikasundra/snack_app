import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/string_names.dart';
import 'package:snacks_ordering_app/widgets/svg_image.dart';

class MenuScreenAppBar extends StatelessWidget {
  const MenuScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: _leading(),
        title: _title(context),
        actions: [_action()],
      ),
    );
  }

  Widget _leading() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ));

  Widget _title(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgImage(AssetNameString.locationIconAssetName),
        _titleText(context),
        SvgImage(AssetNameString.downArrowIconAssetName),
      ]);

  Widget _titleText(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          StringNames.pvrJabalpur,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );

  Widget _action() => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.mic),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
      );
}
