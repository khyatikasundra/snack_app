import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:snacks_ordering_app/data_class/size_model.dart';

part 'check_out_screen_event.dart';
part 'check_out_screen_state.dart';

class CheckOutScreenBloc
    extends Bloc<CheckOutScreenEvent, CheckOutScreenState> {
  CheckOutScreenBloc() : super(CheckOutScreenInitial()) {
    on<SizeSelectionEvent>(_sizeSelection);
  }

  FutureOr<void> _sizeSelection(
      SizeSelectionEvent event, Emitter<CheckOutScreenState> emit) {
    for (int i = 0; i < sizesList.length; i++) {
      sizesList[i].isSelected = (i == event.index);
    }
    emit(CheckOutScreenInitial());
    emit(SizesSelectedSuccessful());
  }
}
