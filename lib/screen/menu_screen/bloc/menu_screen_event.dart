part of 'menu_screen_bloc.dart';

sealed class MenuScreenEvent extends Equatable {
  const MenuScreenEvent();

  @override
  List<Object> get props => [];
}

class CategoryCardSelectedEvent extends MenuScreenEvent {
  final int index;
  const CategoryCardSelectedEvent({required this.index});
  @override
  List<Object> get props => [index];
}

class OnSwitchSelectionGridOrListViewEvent extends MenuScreenEvent {
  final bool value;
  const OnSwitchSelectionGridOrListViewEvent({required this.value});
  @override
  List<Object> get props => [value];
}
