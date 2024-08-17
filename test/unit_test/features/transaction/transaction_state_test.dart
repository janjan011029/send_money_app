import 'package:flutter_test/flutter_test.dart';
import 'package:send_money_app/features/transaction/presentation/bloc/transaction/transaction_bloc.dart';

void main() {

  test('TransactionState Test', (){
    final state = TransactionSuccessState();

    final List<Object?> expectedProps = [];

    expect(state.props, expectedProps);
  });
}