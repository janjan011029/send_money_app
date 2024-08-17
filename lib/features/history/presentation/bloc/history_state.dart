// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class HistoryInitialState extends HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryEmptyState extends HistoryState {}

class HistoryLoadedState extends HistoryState {
  final List<TransactionModel> historyItems;

  HistoryLoadedState({required this.historyItems});

  @override
  List<Object> get props => [historyItems];

  HistoryLoadedState copyWith({
    List<TransactionModel>? historyItems,
  }) {
    return HistoryLoadedState(
      historyItems: historyItems ?? this.historyItems,
    );
  }
}

class HistoryErrorState extends HistoryState {
  final String message;

  HistoryErrorState(this.message);

  @override
  List<Object> get props => [message];
}
