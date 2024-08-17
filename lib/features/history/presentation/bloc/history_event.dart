part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class GetHistory extends HistoryEvent {
  const GetHistory({required this.items});

  final List<TransactionModel> items;

  @override
  List<Object> get props => [items];
}
