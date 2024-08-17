import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/money_loading_widget.dart';
import '../../../../../widgets/transaction_item_widget.dart';
import '../../../savings/presentation/cubit/savings_cubit.dart';
import '../bloc/history_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late final HistoryBloc bloc;
  late final SavingsCubit cubit;

  @override
  void initState() {
    bloc = context.read<HistoryBloc>();
    cubit = context.read<SavingsCubit>();

    bloc.add(GetHistory(items: cubit.state.items));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is HistoryLoadingState) {
              return const MoneyLoading();
            }

            if (state is HistoryEmptyState) {
              return const Center(
                child: Text('No Items Found.'),
              );
            }

            if (state is HistoryErrorState) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is HistoryLoadedState) {
              final transactions = state.historyItems;
              return ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  final title = transaction.name;
                  final date = transaction.date;
                  final amount = transaction.amount;

                  return TransactionItem(
                    title: title,
                    date: date,
                    amount: amount.toString(),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
