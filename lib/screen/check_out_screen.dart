import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/data_class/size_model.dart';
import 'package:snacks_ordering_app/string/assets_string.dart';
import 'package:snacks_ordering_app/string/string_names.dart';
import 'package:snacks_ordering_app/widgets/background_container.dart';
import 'package:snacks_ordering_app/widgets/check_out_screen_app_bar.dart';
import 'package:snacks_ordering_app/widgets/custom_container_sizes_button.dart';
import 'package:snacks_ordering_app/widgets/custom_scaffold.dart';
import 'package:snacks_ordering_app/widgets/custom_scroll_widget.dart';
import 'package:snacks_ordering_app/widgets/svg_image.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _isSizeSelected = -1;
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CheckOutScreenAppBar(),
      body: BackgroundContainer(
        child: SafeArea(
          child: CustomScrollWidget(
            child: Container(
              margin: const EdgeInsets.only(left: 19, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleBlock(),
                  _ratingBar(),
                  _detailTitleText(),
                  _detailDescriptionText(),
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

  void onTapIncrementCounter() {
    _count++;
    setState(() {});
  }

  void onTapDecrementCounter() {
    _count = _count > 1 ? _count - 1 : 1;
    setState(() {});
  }

  //? WIDGET METHOD

  Widget _titleBlock() => SizedBox(
        height: 360,
        child: Stack(
            children: [_richTextTitle(), _itemImage(), _sizeQuantitySection()]),
      );

  Widget _customCounterContainer(String assetName, VoidCallback onPressed) =>
      Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: IconButton(icon: SvgImage(assetName), onPressed: onPressed));

  Widget _richTextTitle() => Align(
        alignment: Alignment.topLeft,
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: StringNames.kMargheritaPizza,
              style: Theme.of(context).textTheme.displayLarge),
          TextSpan(
              text: StringNames.margheritaPrice,
              style: Theme.of(context).textTheme.displayMedium)
        ])),
      );

  Widget _itemImage() => Align(
        alignment: Alignment.bottomRight,
        child: Image.asset(
          AssetNameString.pizzaImageBigSizeAssertName,
        ),
      );
  Widget _sizeQuantitySection() => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 115),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sizeText(),
              _sizeButtonListView(),
              _qualityText(),
              _counterButtonRow(),
            ],
          ),
        ),
      );
  Widget _sizeText() => Text(
        StringNames.sizeString,
        style: Theme.of(context).textTheme.headlineSmall,
      );

  Widget _sizeButtonListView() => Expanded(
        child: SizedBox(
          width: 32,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sizesList.length,
              itemBuilder: (context, index) {
                return CustomContainerSizesButton(
                  onIconClick: () {
                    setState(() {
                      _isSizeSelected = index;
                    });
                  },
                  color: _isSizeSelected == index
                      ? const Color(0xFfFECE00)
                      : Colors.white,
                  index: index,
                );
              }),
        ),
      );

  Widget _qualityText() => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          StringNames.quantityString,
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
              child: Text(StringNames.count(_count),
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
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _reviewDetailRichText(AssetNameString.starIcon, StringNames.rating),
            _reviewDetailRichText(
                AssetNameString.fireIconAssetName, StringNames.calories),
            _reviewDetailRichText(
                AssetNameString.timeClockIcon, StringNames.timing)
          ],
        ),
      );

  Widget _detailTitleText() =>
      Text(StringNames.details, style: Theme.of(context).textTheme.titleMedium);

  Widget _detailDescriptionText() => Text(StringNames.detailContent,
      style: Theme.of(context).textTheme.bodySmall);

  Widget _addToCardButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: InkWell(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(StringNames.yourItemAddedToCart(_count)),
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
          child: Center(child: Text(StringNames.addToCart)),
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
          child: SvgImage(assertName),
        )),
        TextSpan(text: reviewText, style: Theme.of(context).textTheme.bodySmall)
      ]));
}
