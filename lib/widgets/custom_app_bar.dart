import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? title;
  final String? leadingAssetName;
  final Widget? trailingIcon;
  final List<Widget>? actions;
  final String? locationDataText;
  final bool? trailingEnable;
  final bool? middleTitleLocationTextEnable;

  const CustomAppBar(
      {this.leadingAssetName,
      this.trailingIcon,
      this.title,
      this.actions,
      this.locationDataText,
      this.trailingEnable,
      this.middleTitleLocationTextEnable,
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
      onPressed: () {}, icon: SvgPicture.asset(leadingAssetName ?? ""));

  Widget _middleTitleLocation(bool? middleTitleLocationTextEnable) => Visibility(
        visible: middleTitleLocationTextEnable ?? false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/icon_location.svg",
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                locationDataText ?? "PVR,Jabalpur",
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SvgPicture.asset("assets/icons/icon_down_arrow.svg"),
          ],
        ),
      );

  Widget _trailing(bool? trailingEnable, Widget? trailingIcon) => Visibility(
        visible: trailingEnable ?? false,
        child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: IconButton(
              onPressed: () {},
              icon: trailingIcon ?? const Icon(Icons.question_mark),
            )),
      );
}
