import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../transaction/domain/models/transaction_model.dart';

part 'savings_state.dart';

class SavingsCubit extends Cubit<SavingsState> {
  SavingsCubit() : super(const SavingsState());

  void showSavings(bool value) {
    emit(state.copyWith(isHidden: value));
  }

  void addSavingsHistory(TransactionModel item) {

    if(item.amount > state.amount) {
      emit(state.copyWith());
      return;
    }
    
    emit(state.copyWith(
      amount: state.amount - item.amount,
      items: [item, ...state.items],
    ));
  }
}
