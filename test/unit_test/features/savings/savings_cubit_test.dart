import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:send_money_app/features/savings/presentation/cubit/savings_cubit.dart';
import 'package:send_money_app/features/transaction/domain/models/transaction_model.dart';

void main() {
  group('SavingsCubit', () {
    late SavingsCubit cubit;

    setUp(() {
      cubit = SavingsCubit();
    });

    tearDown(() {
      cubit.close();
    });

    blocTest<SavingsCubit, SavingsState>(
      'emits [SavingsState] with updated isHidden when showSavings is called',
      build: () => cubit,
      act: (cubit) => cubit.showSavings(true),
      expect: () => [
        const SavingsState(isHidden: true),
      ],
    );

    blocTest<SavingsCubit, SavingsState>(
      'emits [SavingsState] with updated amount and items when addSavingsHistory is called',
      build: () => cubit,
      act: (cubit) {
        const transaction = TransactionModel(
          id: 'ffsgf1s2',
          name: 'Test Transaction',
          amount: 50,
          date: '2024-08-14 10:15:42.123',
        );
        cubit.addSavingsHistory(transaction);
      },
      expect: () => [
        const SavingsState(
          amount: 450,
          items: [
            TransactionModel(
              id: 'ffsgf1s2',
              name: 'Test Transaction',
              amount: 50,
              date: '2024-08-14 10:15:42.123',
            ),
          ],
        ),
      ],
    );
    blocTest<SavingsCubit, SavingsState>(
      'emits [SavingsState] with the same state when the send amount is greater than wallet amount balance.',
      build: () => cubit,
      act: (cubit) {
        const transaction = TransactionModel(
          id: 'ffsgf1s2',
          name: 'Test Transaction',
          amount: 600,
          date: '2024-08-14 10:15:42.123',
        );
        cubit.addSavingsHistory(transaction);
      },
      expect: () => [
        const SavingsState(
          amount: 500,
          isHidden: true,
          items: [],
        ),
      ],
    );
  });
}
