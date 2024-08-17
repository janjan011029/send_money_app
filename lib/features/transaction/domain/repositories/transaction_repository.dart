import 'package:dio/dio.dart';
import 'package:send_money_app/utils/api_urls.dart';
import 'package:send_money_app/utils/helpers/transaction_helper.dart';

import '../../../../../api/client.dart';
import '../models/transaction_model.dart';
import 'i_transaction_repository.dart';

class TransactionRepository implements ITransactionRepository {
  final DioClient _dioClient;

  TransactionRepository({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<TransactionModel> sendMoney({
    required String name,
    required double amount,
  }) async {
    try {
      final result = await _dioClient.post(
        ApiUrls.sendMoney,
        data: {
          "id": TransactionHelper().generateRandomString(8),
          "name": name,
          "created_date": DateTime.now().toString(),
          "amount": amount,
        },
      );

      final item = result.data;

      return TransactionModel.fromJson(item);
    } on DioException catch (err) {
      throw err.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
