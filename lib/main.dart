import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/screen/menu_screen/menu_page.dart';
import 'package:snacks_ordering_app/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MenuPage(),
      theme: AppTheme.getTheme(),
    );
  }
}
