import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';

part 'navi_count_event.dart';
part 'navi_count_state.dart';

class NaviCountBloc extends HydratedBloc<NaviCountEvent, NaviCountState> {
  NaviCountBloc() : super(NaviCountInitial(switchValue: false)) {
    on<TodoOnEvent>((event, emit) {
      emit(NaviCountState(switchValue: true));
    });
    on<TodoOffEvent>((event, emit) {
      emit(NaviCountState(switchValue: false));
    });
  }

  @override
  NaviCountState? fromJson(Map<String, dynamic> json) {
    return NaviCountState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(NaviCountState state) {
    return state.toMap();
  }
}
