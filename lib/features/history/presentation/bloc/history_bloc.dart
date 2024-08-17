import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../transaction/domain/models/transaction_model.dart';
import '../../domain/repositories/i_history_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final IHistoryRepository repository;
  HistoryBloc(this.repository) : super(HistoryInitialState()) {
    on<GetHistory>(_onGetHistory);
  }

  FutureOr<void> _onGetHistory(
      GetHistory event, Emitter<HistoryState> emit) async {
    try {
      emit(HistoryLoadingState());
      final savingItems = event.items;
      final items = await repository.getAllTransactions();

      final result = [...savingItems, ...items];

      if(result.isEmpty) {
        emit(HistoryEmptyState());
        return;
      }

      result.sort((a, b) {
        final dateA = DateTime.parse(a.date);
        final dateB = DateTime.parse(b.date);
        return dateB.compareTo(dateA);
      });

      emit(HistoryLoadedState(historyItems: result));
    } catch (e) {
      emit(HistoryErrorState(e.toString()));
    }
  }
}
