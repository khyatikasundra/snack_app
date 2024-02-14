import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/check_out_screen_strings.dart';
import 'package:snacks_ordering_app/widgets/background_container.dart';
import 'package:snacks_ordering_app/widgets/custom_app_bar.dart';
import 'package:snacks_ordering_app/widgets/custom_container_sizes_button.dart';
import 'package:snacks_ordering_app/widgets/custom_scaffold.dart';
import 'package:snacks_ordering_app/widgets/custom_scroll_widget.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final FocusNode _focusNode = FocusNode();
  double? imageSizeWidth = 253;
  @override
  void initState() {
    _focusNode.addListener(onTapIconButtonSizeEvent);
    super.initState();
  }

  void onTapIconButtonSizeEvent() {
    imageSizeWidth = _focusNode.hasFocus ? 150 : 150;
    print("clicked");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        leadingAssetName: AssetNameString.leftArrowIconAssertName,
        onPressedLeadingIcon: () => Navigator.pop(context),
        trailingEnable: true,
        trailingIconBackgroundColor: const Color(0xFFFECE00),
        trailingIcon: SvgPicture.asset(AssetNameString.heartIconAssertName),
      ),
      body: BackgroundContainer(
        child: SafeArea(
          child: CustomScrollWidget(
            child: Container(
              margin: const EdgeInsets.only(left: 19, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 400,
                    child: Stack(children: [
                      _richTextTitle(),
                      _itemImage(),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                CheckOutScreenStrings.sizeString,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              CustomContainerSizesButton(
                                icon: SvgPicture.asset(
                                    AssetNameString.sLetterIcon),
                                // onPressIconEvent: onTapIconButtonSizeEvent,focusNode: _focusNode,
                              ),
                              CustomContainerSizesButton(
                                  icon: SvgPicture.asset(
                                      AssetNameString.mLetterIcon)),
                              CustomContainerSizesButton(
                                  icon: SvgPicture.asset(
                                      AssetNameString.lLetterIcon)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Text(
                                  CheckOutScreenStrings.quantityString,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              Row(
                                children: [
                                  CustomContainerSizesButton(
                                      icon: SvgPicture.asset(
                                          AssetNameString.dashSignIcon)),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: Text("1",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  CustomContainerSizesButton(
                                      icon: SvgPicture.asset(
                                          AssetNameString.plusSignIcon))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    _reviewDetailRichText(
                                        AssetNameString.starIcon,
                                        CheckOutScreenStrings.rating),
                                    _reviewDetailRichText(
                                        AssetNameString.fireIconAssetName,
                                        CheckOutScreenStrings.calories),
                                    _reviewDetailRichText(
                                        AssetNameString.timeClockIcon,
                                        CheckOutScreenStrings.timing)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                  _detailContentRichText()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _richTextTitle() => Align(
        alignment: Alignment.topLeft,
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: CheckOutScreenStrings.margheritaPizza,
              style: Theme.of(context).textTheme.displayLarge),
          TextSpan(
              text: CheckOutScreenStrings.margheritaPrice,
              style: Theme.of(context).textTheme.displayMedium)
        ])),
      );

  Widget _itemImage() => Align(
        alignment: Alignment.centerRight,
        child: Image.asset(
          AssetNameString.pizzaImageBigSizeAssertName,
          width: imageSizeWidth,
        ),
      );

  Widget _detailContentRichText() => RichText(
          text: TextSpan(children: [
        TextSpan(
            text: CheckOutScreenStrings.details,
            style: Theme.of(context).textTheme.titleMedium),
        const WidgetSpan(
            child: SizedBox(
          height: 12,
        )),
        TextSpan(
            text: CheckOutScreenStrings.detailContent,
            style: Theme.of(context).textTheme.bodySmall)
      ]));
  Widget _reviewDetailRichText(String assertName, String reviewText) =>
      RichText(
          text: TextSpan(children: [
        WidgetSpan(
            child: Center(
          child: SvgPicture.asset(assertName),
        )),
        TextSpan(text: reviewText, style: Theme.of(context).textTheme.bodySmall)
      ]));
}
