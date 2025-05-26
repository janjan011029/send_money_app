// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BottomNavIndexState extends Equatable {
  final int index;

  const BottomNavIndexState({this.index = 0});

  BottomNavIndexState copyWith({
    int? index,
  }) {
    return BottomNavIndexState(
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [index];
}
