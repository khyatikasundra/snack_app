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
  final FocusNode _focusNodeForSmallSize = FocusNode();
  final FocusNode _focusNodeForMediumSize = FocusNode();
  final FocusNode _focusNodeForLargeSize = FocusNode();
  bool _isLiking = false;

  double? imageSizeWidth = 253;
  Color? containerBackgroundColorSmallSize = Colors.white;
  Color? containerBackgroundColorMediumSize = Colors.white;
  Color? containerBackgroundColorLargeSize = Colors.white;
  Color? counterBackgroundColor = Colors.white;
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: _customAppBar(),
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
                      _sizeQuantityRatingSection()
                    ]),
                  ),
                  _detailContentRichText(),
                  _addToCardButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //?FUNCTIONS
  @override
  void initState() {
    _focusNodeForSmallSize.addListener(onTapIconButtonSizeEvent);
    _focusNodeForMediumSize.addListener(onTapIconButtonSizeEvent);
    _focusNodeForLargeSize.addListener(onTapIconButtonSizeEvent);
    super.initState();
  }

  @override
  void dispose() {
    _focusNodeForSmallSize.dispose();
    _focusNodeForLargeSize.dispose();
    _focusNodeForMediumSize.dispose();
    super.dispose();
  }

  void onTapIconButtonSizeEvent() {
    if (_focusNodeForSmallSize.hasFocus) {
      imageSizeWidth = 150;
      containerBackgroundColorSmallSize = Colors.yellow;
      containerBackgroundColorMediumSize = Colors.white;
      containerBackgroundColorLargeSize = Colors.white;
    } else if (_focusNodeForMediumSize.hasFocus) {
      imageSizeWidth = 200;
      containerBackgroundColorSmallSize = Colors.white;
      containerBackgroundColorMediumSize = Colors.yellow;
      containerBackgroundColorLargeSize = Colors.white;
    } else if (_focusNodeForLargeSize.hasFocus) {
      imageSizeWidth = 253;
      containerBackgroundColorSmallSize = Colors.white;
      containerBackgroundColorMediumSize = Colors.white;
      containerBackgroundColorLargeSize = Colors.yellow;
    }
    setState(() {});
  }

  void onTapIncrementCounter() {
    _count++;

    setState(() {});
  }

  void onTapDecrementCounter() {
    _count = _count > 0 ? _count - 1 : 0;

    setState(() {});
  }

  void likeButtonAction() {
    _isLiking = !_isLiking;
    setState(() {});
  }

  //? WIDGET METHOD
  Widget _customAppBar() => CustomAppBar(
        leadingAssetName: AssetNameString.leftArrowIconAssertName,
        onPressedLeadingIcon: () => Navigator.pop(context),
        trailingEnable: true,
        trailingIconBackgroundColor: const Color(0xFFFECE00),
        trailingIcon: _isLiking
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        trailingOnPressEvent: likeButtonAction,
      );

  Widget _customCounterContainer(
          String assetName, VoidCallback onPressed) =>
      Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: counterBackgroundColor),
          child: IconButton(
              icon: SvgPicture.asset(assetName), onPressed: onPressed));

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
  Widget _sizeQuantityRatingSection() => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sizeText(),
              _customContainerSmallSizeButton(),
              _customContainerMediumSizeButton(),
              _customContainerLargeSizeButton(),
              _qualityText(),
              _counterButtonRow(),
              _ratingBar()
            ],
          ),
        ),
      );
  Widget _sizeText() => Text(
        CheckOutScreenStrings.sizeString,
        style: Theme.of(context).textTheme.headlineSmall,
      );

  Widget _customContainerSmallSizeButton() => CustomContainerSizesButton(
        icon: SvgPicture.asset(AssetNameString.sLetterIcon),
        onPressIconEvent: onTapIconButtonSizeEvent,
        focusNode: _focusNodeForSmallSize,
        color: containerBackgroundColorSmallSize,
      );

  Widget _customContainerMediumSizeButton() => CustomContainerSizesButton(
        icon: SvgPicture.asset(AssetNameString.mLetterIcon),
        onPressIconEvent: onTapIconButtonSizeEvent,
        focusNode: _focusNodeForMediumSize,
        color: containerBackgroundColorMediumSize,
      );

  Widget _customContainerLargeSizeButton() => CustomContainerSizesButton(
        icon: SvgPicture.asset(AssetNameString.lLetterIcon),
        onPressIconEvent: onTapIconButtonSizeEvent,
        focusNode: _focusNodeForLargeSize,
        color: containerBackgroundColorLargeSize,
      );

  Widget _qualityText() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          CheckOutScreenStrings.quantityString,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );

  Widget _counterButtonRow() => Row(
        children: [
          _customCounterContainer(
            AssetNameString.dashSignIcon,
            onTapDecrementCounter,
          ),
          SizedBox(
            width: 35,
            child: Center(
              child: Text(CheckOutScreenStrings.count(_count),
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
          _customCounterContainer(
            AssetNameString.plusSignIcon,
            onTapIncrementCounter,
          )
        ],
      );

  Widget _ratingBar() => Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _reviewDetailRichText(
                AssetNameString.starIcon, CheckOutScreenStrings.rating),
            _reviewDetailRichText(AssetNameString.fireIconAssetName,
                CheckOutScreenStrings.calories),
            _reviewDetailRichText(
                AssetNameString.timeClockIcon, CheckOutScreenStrings.timing)
          ],
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

  Widget _addToCardButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: InkWell(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(CheckOutScreenStrings.yourItemAddedToCart(_count)),
              ),
            ),
            child: _addButtonContainer(),
          ),
        ),
      );

  Widget _addButtonContainer() => Container(
        width: MediaQuery.of(context).size.width > 400 ? 400 : 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFFECE00),
            boxShadow: addButtonBoxShadow()),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(child: Text(CheckOutScreenStrings.addToCart)),
        ),
      );

  List<BoxShadow>? addButtonBoxShadow() => [
        BoxShadow(
            blurRadius: 100,
            color: const Color(0xFFFECE00).withOpacity(0.2),
            offset: const Offset(0, 30),
            spreadRadius: 0)
      ];

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
