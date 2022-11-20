part of 'navi_count_bloc.dart';

class NaviCountState extends Equatable {
  final bool switchValue;

  const NaviCountState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchValue': switchValue,
    };
  }

  factory NaviCountState.fromMap(Map<String, dynamic> map) {
    return NaviCountState(
      switchValue: map['switchValue'] as bool,
    );
  }
}

class NaviCountInitial extends NaviCountState {
  NaviCountInitial({required super.switchValue});
}
