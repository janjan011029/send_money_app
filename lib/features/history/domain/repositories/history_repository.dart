import 'dart:async';

import 'package:dio/dio.dart';
import 'package:send_money_app/utils/api_urls.dart';

import '../../../../../api/client.dart';
import '../../../transaction/domain/models/transaction_model.dart';
import 'i_history_repository.dart';
class HistoryRepository implements IHistoryRepository {
  final DioClient _dioClient;

  HistoryRepository({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final List<TransactionModel> transactions = [];
    try {
      // Put an delay here to see the loading animation when fetching API
      await Future.delayed(const Duration(milliseconds: 1500), () async {
        final result = await _dioClient.get(ApiUrls.getAllTransactions);

        final data = result.data;

        for (var item in data) {
          transactions.add(TransactionModel.fromJson(item));
        }
      });

      return transactions;
    } on DioException catch (err) {
      throw err.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
