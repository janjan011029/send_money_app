import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  const TransactionModel({
    required this.id,
    required this.name,
    required this.date,
    required this.amount,
  });

  final String id;
  final String name;
  final String date;
  final double amount;

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      date: json['created_date'] as String,
      amount: (json['amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_date': date,
      'amount': amount,
    };
  }

  @override
  List<Object?> get props => [id, name, date, amount];
}
