import 'package:flutter_test/flutter_test.dart';
import 'package:send_money_app/features/history/presentation/bloc/history_bloc.dart';

void main() {
  test('HistoryState Test', () {
    final state = HistoryLoadedState(historyItems: const []);

    state.copyWith();

    final List<Object?> expectedProps = [state.historyItems];

    expect(state.props, expectedProps);
  });
}
