import 'package:flutter/material.dart';

class CheckOutScreenAppBar extends StatefulWidget {
  const CheckOutScreenAppBar({super.key});
  @override
  State<CheckOutScreenAppBar> createState() => _CheckOutScreenAppBarState();
}

class _CheckOutScreenAppBarState extends State<CheckOutScreenAppBar> {
  bool _isLike = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: _leading(),
        actions: [_action()],
      ),
    );
  }

  void onClickBackButton() {
    Navigator.pop(context);
  }

  Widget _leading() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: onClickBackButton,
        icon: const Icon(Icons.arrow_back_ios_new),
      ));

  void onTapLikeButton() {
    _isLike = !_isLike;
    setState(() {});
  }

  Widget _action() => IconButton(
        onPressed: onTapLikeButton,
        icon: _isLike
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
      );
}
