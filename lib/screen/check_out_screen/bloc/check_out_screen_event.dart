part of 'check_out_screen_bloc.dart';

sealed class CheckOutScreenEvent extends Equatable {
  const CheckOutScreenEvent();

  @override
  List<Object> get props => [];
}

class SizeSelectionEvent extends CheckOutScreenEvent {
  final int index;
  const SizeSelectionEvent({required this.index});
  @override
  List<Object> get props => [index];
}
