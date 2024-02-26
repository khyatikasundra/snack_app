part of 'check_out_screen_bloc.dart';

sealed class CheckOutScreenState extends Equatable {
  const CheckOutScreenState();

  @override
  List<Object> get props => [];
}

final class CheckOutScreenInitial extends CheckOutScreenState {}

class SizesSelectedSuccessful extends CheckOutScreenState {}
