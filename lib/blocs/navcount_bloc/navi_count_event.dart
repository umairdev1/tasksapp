part of 'navi_count_bloc.dart';

abstract class NaviCountEvent extends Equatable {
  const NaviCountEvent();

  @override
  List<Object> get props => [];
}

class TodoOnEvent extends NaviCountEvent {}

class TodoOffEvent extends NaviCountEvent {}
