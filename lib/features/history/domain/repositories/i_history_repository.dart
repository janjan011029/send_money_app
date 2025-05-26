import '../../../transaction/data/models/transaction_model.dart';

abstract class IHistoryRepository {
  Future<List<TransactionModel>> getAllTransactions();
}
