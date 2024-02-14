import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/menu_screen_strings.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? title;
  final String? leadingAssetName;
  final Widget? trailingIcon;
  final List<Widget>? actions;
  final String? locationDataText;
  final bool? trailingEnable;
  final bool? middleTitleLocationTextEnable;
  final Color? trailingIconBackgroundColor;
  final void Function()? onPressedLeadingIcon;

  const CustomAppBar(
      {this.leadingAssetName,
      this.trailingIcon,
      this.title,
      this.actions,
      this.locationDataText,
      this.trailingEnable,
      this.middleTitleLocationTextEnable,
      this.trailingIconBackgroundColor,
      this.onPressedLeadingIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 26),
      child: AppBar(
          backgroundColor: Colors.transparent,
          leading: _leading(),
          title: _middleTitleLocation(middleTitleLocationTextEnable),
          actions: [_trailing(trailingEnable, trailingIcon)]),
    );
  }

//?WIDGET METHODS

  Widget _leading() => IconButton(
      onPressed: onPressedLeadingIcon, icon: SvgPicture.asset(leadingAssetName ?? ""));

  Widget _middleTitleLocation(bool? middleTitleLocationTextEnable) =>
      Visibility(
        visible: middleTitleLocationTextEnable ?? false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetNameString.locationIconAssetName,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                locationDataText ?? MenuScreenStrings.pvrJabalpur,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SvgPicture.asset(AssetNameString.downArrowIconAssetName),
          ],
        ),
      );

  Widget _trailing(bool? trailingEnable, Widget? trailingIcon) => Visibility(
        visible: trailingEnable ?? false,
        child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: trailingIconBackgroundColor ?? Colors.white),
            child: IconButton(
              onPressed: () {},
              icon: trailingIcon ?? const Icon(Icons.question_mark),
            )),
      );
}
