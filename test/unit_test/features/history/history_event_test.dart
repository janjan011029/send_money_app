import 'package:flutter_test/flutter_test.dart';
import 'package:send_money_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:send_money_app/features/transaction/domain/models/transaction_model.dart';

void main() {
  test('HistoryEvent Test', () {
    final mockItems = <TransactionModel>[
      TransactionModel(
        id: 'dfgklk42',
        name: 'Sample',
        amount: 100,
        date: DateTime.now().toString(),
      ),
      TransactionModel(
        id: 'dfgklk42',
        name: 'Sample',
        amount: 100,
        date: DateTime.now().toString(),
      ),
      TransactionModel(
        id: 'dfgklk42',
        name: 'Sample',
        amount: 100,
        date: DateTime.now().toString(),
      ),
    ];

    final event = GetHistory(items: mockItems);

    final List<Object?> expectedProps = [event.items];

    // Assert
    expect(event.props, expectedProps);
  });
}
