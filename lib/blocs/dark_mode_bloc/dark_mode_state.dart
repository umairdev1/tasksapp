// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'dark_mode_bloc.dart';

class DarkModeState extends Equatable {
  final bool switchValue;
  const DarkModeState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchValue': switchValue,
    };
  }

  factory DarkModeState.fromMap(Map<String, dynamic> map) {
    return DarkModeState(
      switchValue: map['switchValue'] as bool,
    );
  }
}

class DarkModeInitial extends DarkModeState {
  const DarkModeInitial({required super.switchValue});
}
