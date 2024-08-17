import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:send_money_app/features/transaction/domain/models/transaction_model.dart';
import 'package:send_money_app/features/transaction/domain/repositories/i_transaction_repository.dart';
import 'package:send_money_app/features/transaction/presentation/bloc/transaction/transaction_bloc.dart';

import 'transaction_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ITransactionRepository>(),
])
void main() {
  group('TransactionBloc Test', () {
    late ITransactionRepository repository;
    late TransactionBloc bloc;

    setUp(() {
      repository = MockITransactionRepository();
      bloc = TransactionBloc(repository);
    });

    tearDown(() => bloc.close());

    blocTest<TransactionBloc, TransactionState>(
      'emits [TransactionErrorState] if the amount is greater than savings amount',
      build: () => bloc,
      act: (bloc) {
        const event = SendMoneyEvent(
          name: 'Janjan',
          amount: 501,
          savings: 500,
        );

        bloc.add(event);
      },
      expect: () => <TransactionState>[
        TransactionLoadingState(),
        TransactionErrorState('Insufficient Amount'),
      ],
    );

    blocTest<TransactionBloc, TransactionState>(
      'emits [TransactionErrorState] when the API fails',
      build: () {
        when(repository.sendMoney(name: 'Janjan', amount: 100))
            .thenThrow(Exception('API Error'));

        return bloc;
      },
      act: (bloc) {
        const event = SendMoneyEvent(
          name: 'Janjan',
          amount: 100,
          savings: 500,
        );

        bloc.add(event);
      },
      expect: () => <TransactionState>[
        TransactionLoadingState(),
        TransactionErrorState('Something went wrong.'),
      ],
    );

    blocTest<TransactionBloc, TransactionState>(
      'emits [TransactionSuccessState] when all the logic is passed and get the API result.',
      build: () {
        const mockData = TransactionModel(
          id: 'hgjt35s1',
          name: 'Janjan',
          date: '2024-08-14 10:15:42.123',
          amount: 100,
        );
        when(repository.sendMoney(name: 'Janjan', amount: 100))
            .thenAnswer((_) async => mockData);

        return bloc;
      },
      act: (bloc) {
        const event = SendMoneyEvent(
          name: 'Janjan',
          amount: 100,
          savings: 500,
        );

        bloc.add(event);
      },
      expect: () => <TransactionState>[
        TransactionLoadingState(),
        TransactionSuccessState(),
      ],
      verify: (_) {
        verify(repository.sendMoney(name: 'Janjan', amount: 100)).called(1);
      },
    );
  });
}
