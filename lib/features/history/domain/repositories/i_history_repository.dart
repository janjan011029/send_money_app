import '../../../transaction/domain/models/transaction_model.dart';

abstract class IHistoryRepository {
  Future<List<TransactionModel>> getAllTransactions();
}
