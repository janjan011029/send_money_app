part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  @override
  List<Object> get props => [];
}

class TransactionInitialState extends TransactionState {}

class TransactionLoadingState extends TransactionState {}

class TransactionSuccessState extends TransactionState {}

class TransactionInsufficientState extends TransactionState {}

class TransactionErrorState extends TransactionState {
  final String message;

  TransactionErrorState(this.message);

  @override
  List<Object> get props => [message];
}
