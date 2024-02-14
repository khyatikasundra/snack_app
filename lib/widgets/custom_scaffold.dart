import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final bool? extendBodyBehindAppBar;
  final Widget? appBar;
  final Widget? body;
  const CustomScaffold(
      {this.backgroundColor = Colors.transparent,
      this.extendBodyBehindAppBar,
      this.appBar,
      this.body,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? true,
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: appBar ?? const Text("app Bar not Showing")),
      body: body,
    );
  }
}
