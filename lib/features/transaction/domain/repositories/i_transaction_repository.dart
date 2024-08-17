import '../models/transaction_model.dart';

abstract class ITransactionRepository {
  Future<TransactionModel> sendMoney({
    required String name,
    required double amount,
  });
}
