import 'package:flutter_test/flutter_test.dart';
import 'package:send_money_app/features/savings/presentation/cubit/savings_cubit.dart';
import 'package:send_money_app/features/transaction/domain/models/transaction_model.dart';

void main() {
  test('SavingsState test', () {
    final mockItems = <TransactionModel>[
      const TransactionModel(
        id: 'dfgklk41',
        name: 'Sample',
        amount: 100,
        date: "2024-08-14 10:15:42.123",
      ),
      const TransactionModel(
        id: 'dfgklk42',
        name: 'Sample',
        amount: 100,
        date: "2024-08-14 10:15:42.124",
      ),
      const TransactionModel(
        id: 'dfgklk43',
        name: 'Sample',
        amount: 100,
        date: "2024-08-14 10:15:42.125",
      ),
    ];

    final state = SavingsState(
      isHidden: false,
      amount: 400,
      items: mockItems,
    );

    state.copyWith();

    final List<Object?> expectedProps = [
      state.isHidden,
      state.amount,
      state.items
    ];

    expect(state.props, expectedProps);
  });
}
