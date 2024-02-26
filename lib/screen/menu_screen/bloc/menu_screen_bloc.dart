import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:snacks_ordering_app/data_class/category_section_model.dart';
import 'package:snacks_ordering_app/data_class/popular_now_section_model.dart';

part 'menu_screen_event.dart';
part 'menu_screen_state.dart';

class MenuScreenBloc extends Bloc<MenuScreenEvent, MenuScreenState> {
  static List<PopularNowSectionModel> selectedItem = popularNowItem;
  MenuScreenBloc() : super(MenuScreenInitial()) {
    on<MenuScreenEvent>((event, emit) {});
    on<CategoryCardSelectedEvent>(_cardSelectionBackgroundColorChange);
    on<OnSwitchSelectionGridOrListViewEvent>(_onSwitchSelectionGridOrListView);
  }

  FutureOr<void> _cardSelectionBackgroundColorChange(
      CategoryCardSelectedEvent event, Emitter<MenuScreenState> emit) {
    selectedItem = popularNowItem
        .where((element) =>
            categoryItem[event.index].itemCategorization ==
            element.itemCategorization)
        .toList();

    for (int i = 0; i < categoryItem.length; i++) {
      categoryItem[i].isSelected = (i == event.index);
    }
    emit(MenuScreenInitial());
    emit(CategoryCardSelectedState());
  }

  FutureOr<void> _onSwitchSelectionGridOrListView(
      OnSwitchSelectionGridOrListViewEvent event,
      Emitter<MenuScreenState> emit) {
    emit(OnSwitchSelectionGridOrListViewState(value: event.value));
  }
}
