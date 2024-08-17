import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:send_money_app/features/history/domain/repositories/i_history_repository.dart';
import 'package:send_money_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:send_money_app/features/transaction/domain/models/transaction_model.dart';

import 'history_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<IHistoryRepository>(),
])
void main() {
  group('HistoryBLoC Test', () {
    late IHistoryRepository mockRepository;
    late HistoryBloc bloc;
    late List<TransactionModel> expectedResponse;

    setUp(() {
      mockRepository = MockIHistoryRepository();
      bloc = HistoryBloc(mockRepository);

      expectedResponse = <TransactionModel>[
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
    });

    tearDown(() => bloc.close());

    blocTest(
      'emits [HistoryErrorState] when the API calling is failed',
      build: () {
        when(mockRepository.getAllTransactions())
            .thenThrow("Something went wrong");

        return bloc;
      },
      act: (bloc) {
        final event = GetHistory(items: expectedResponse);

        bloc.add(event);
      },
      expect: () => <HistoryState>[
        HistoryLoadingState(),
        HistoryErrorState('Something went wrong'),
      ],
    );

    blocTest(
      'emits [HistoryEmptyState] when the API is not called',
      build: () => bloc,
      act: (bloc) {
        const event = GetHistory(items: []);

        bloc.add(event);
      },
      expect: () => <HistoryState>[
        HistoryLoadingState(),
        HistoryEmptyState(),
      ],
    );
    blocTest(
      'emits [HistoryLoadedState] when the API is called and return Success',
      build: () {
        when(mockRepository.getAllTransactions())
            .thenAnswer((_) async => expectedResponse);
        return bloc;
      },
      act: (bloc) {
        const event = GetHistory(items: []);

        bloc.add(event);
      },
      expect: () => <HistoryState>[
        HistoryLoadingState(),
        HistoryLoadedState(historyItems: expectedResponse.reversed.toList()),
      ],
    );
  });
}
