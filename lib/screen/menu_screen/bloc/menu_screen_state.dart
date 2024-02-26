part of 'menu_screen_bloc.dart';

sealed class MenuScreenState extends Equatable {
  const MenuScreenState();

  @override
  List<Object> get props => [];
}

final class MenuScreenInitial extends MenuScreenState {}

class CategoryCardSelectedState extends MenuScreenState {}

class OnSwitchSelectionGridOrListViewState extends MenuScreenState {
  final bool value;
  const OnSwitchSelectionGridOrListViewState({required this.value});
  @override
  List<Object> get props => [value];
}
