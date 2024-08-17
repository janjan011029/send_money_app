import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/i_transaction_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final ITransactionRepository repository;
  TransactionBloc(this.repository) : super(TransactionInitialState()) {
    on<SendMoneyEvent>(_onSendMoneyEvent);
  }

  void insufficientAmount(
      SendMoneyEvent event, Emitter<TransactionState> emit) {
    emit(TransactionInsufficientState());
  }

  FutureOr<void> _onSendMoneyEvent(
      SendMoneyEvent event, Emitter<TransactionState> emit) async {
    try {
      emit(TransactionLoadingState());

      //Check if the amount send is not greater than savings.
      if (event.amount > event.savings) {
        emit(TransactionErrorState('Insufficient Amount'));
        return;
      }

      final result = await repository.sendMoney(
        name: event.name,
        amount: event.amount,
      );

      if (result.id != '') {
        emit(TransactionSuccessState());
      }
    } catch (e) {
      emit(TransactionErrorState('Something went wrong.'));
    }
  }
}
