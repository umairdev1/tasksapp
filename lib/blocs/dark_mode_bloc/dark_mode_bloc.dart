import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';

part 'dark_mode_event.dart';
part 'dark_mode_state.dart';

class DarkModeBloc extends HydratedBloc<DarkModeEvent, DarkModeState> {
  DarkModeBloc() : super(const DarkModeInitial(switchValue: false)) {
    on<DarkModeOnEvent>((event, emit) {
      emit(const DarkModeState(switchValue: true));
    });
    on<DarkModeOffEvent>((event, emit) {
      emit(const DarkModeState(switchValue: false));
    });
  }

  @override
  DarkModeState? fromJson(Map<String, dynamic> json) {
    return DarkModeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(DarkModeState state) {
    return state.toMap();
  }
}
