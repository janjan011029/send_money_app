import 'package:flutter_test/flutter_test.dart';
import 'package:send_money_app/features/transaction/presentation/bloc/transaction/transaction_bloc.dart';

void main() {
  test('TransactionEvent Test', () {
    const event = SendMoneyEvent(
      name: 'Janjan',
      amount: 100,
      savings: 500,
    );

    final List<Object?> expectedProps = [event.name,event.amount,event.savings];

    // Assert
    expect(event.props, expectedProps);
  });
}
