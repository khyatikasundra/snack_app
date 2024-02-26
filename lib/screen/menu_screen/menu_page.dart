import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snacks_ordering_app/screen/menu_screen/bloc/menu_screen_bloc.dart';
import 'package:snacks_ordering_app/screen/menu_screen/menu_screen.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => MenuScreenBloc()),
      child: const MenuScreen(),
    );
  }
}
