import 'package:flutter/material.dart';
import 'package:snacks_ordering_app/screen/menu_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MenuScreen(),
      theme: ThemeData(
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              displaySmall: TextStyle(
                fontSize: 20,
                color: Color(0xFF9E9E9E),
              ),
              titleMedium: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              titleSmall:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    );
  }
}
