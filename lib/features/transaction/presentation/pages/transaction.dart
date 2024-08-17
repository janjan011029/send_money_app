import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_money_app/utils/helpers/transaction_helper.dart';

import '../../../../../api/client.dart';
import '../../domain/models/transaction_model.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_text_field_widget.dart';
import '../../../history/presentation/bloc/history_bloc.dart';
import '../../../savings/presentation/cubit/savings_cubit.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../bloc/transaction/transaction_bloc.dart';
import '../widgets/bottom_sheet_notification.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late final TextEditingController receiverController;
  late final TextEditingController amountController;
  late final TransactionHelper helper;
  late final Notify notify;
  late final TransactionRepository repository;
  late final TransactionBloc bloc;
  late final SavingsCubit savingsCubit;
  late final HistoryBloc historyBloc;

  @override
  void initState() {
    receiverController = TextEditingController();
    amountController = TextEditingController();
    helper = TransactionHelper();
    notify = Notify();
    repository = TransactionRepository(dioClient: DioClient());
    bloc = TransactionBloc(repository);
    historyBloc = context.read<HistoryBloc>();
    savingsCubit = context.read<SavingsCubit>();

    super.initState();
  }

  @override
  void dispose() {
    receiverController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<TransactionBloc, TransactionState>(
        listener: (context, state) async {
          if (state is TransactionLoadingState) {
            notify.showLoading(context);
          }

          if (state is! TransactionLoadingState) {
            Navigator.of(context).pop();
          }

          if (state is TransactionSuccessState) {
            // if the send money api is success then save the item for the history purposes
            savingsCubit.addSavingsHistory(TransactionModel(
              id: helper.generateRandomString(8),
              name: receiverController.text,
              date: DateTime.now().toString(),
              amount: double.parse(amountController.text),
            ));

            //Refresh item list with local transactions
            historyBloc.add(GetHistory(items: savingsCubit.state.items));

            notify.showBottomSheet(context, true, '');
          }

          if (state is TransactionErrorState) {
            final errMessage = state.message;
            notify.showBottomSheet(context, false, errMessage);
          }
        },
        child: BlocBuilder<TransactionBloc, TransactionState>(
          bloc: bloc,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(title: const Text('Send Money')),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomTextField(
                      key: const Key('ReceiverNameKey'),
                      controller: receiverController,
                      hintText: 'Receiver Name',
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                       key: const Key('AmountKey'),
                      controller: amountController,
                      isNumberOnly: true,
                      hintText: 'Amount',
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        key: const Key('SendMoneyTransactionKey'),
                        title: 'Send Money',
                        onTap: () {
                          final savingsState = savingsCubit.state;

                          bloc.add(SendMoneyEvent(
                            name: receiverController.text,
                            amount: double.parse(amountController.text),
                            savings: savingsState.amount,
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
