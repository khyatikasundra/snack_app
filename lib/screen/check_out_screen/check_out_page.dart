import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snacks_ordering_app/screen/check_out_screen/bloc/check_out_screen_bloc.dart';
import 'package:snacks_ordering_app/screen/check_out_screen/check_out_screen.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutScreenBloc(),
      child: const CheckOutScreen(),
    );
  }
}
