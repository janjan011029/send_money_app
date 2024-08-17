import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:send_money_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:send_money_app/features/savings/presentation/cubit/savings_cubit.dart';
import 'package:send_money_app/router/route_utils.dart';
import 'package:send_money_app/widgets/card_widget.dart';
import 'package:send_money_app/widgets/money_loading_widget.dart';
import 'package:send_money_app/widgets/transaction_header_widget.dart';
import 'package:send_money_app/widgets/transaction_item_widget.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({super.key});

  @override
  State<SavingsPage> createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
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
        title: const Text('Hi Janjan'),
      ),
      body: Column(
        children: [
          BlocBuilder<SavingsCubit, SavingsState>(
            bloc: cubit,
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return CardWidget(
                key: const Key('Card'),
                isHidden: state.isHidden,
                amount: state.amount,
                onTap: () => cubit.showSavings(!state.isHidden),
                sendMoney: () => context.push(AppPage.transaction.path),
              );
            },
          ),
          TransactionHeader(
            title: 'Transaction History',
            onTap: () => context.push(AppPage.history.path),
          ),
          Expanded(
            child: Padding(
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
                      itemCount: min(transactions.length, 5),
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
          ),
        ],
      ),
    );
  }
}
