// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class SendMoneyEvent extends TransactionEvent {
  const SendMoneyEvent({
    required this.name,
    required this.amount,
    required this.savings,
  });
  final String name;
  final double amount;
  final double savings;

  @override
  List<Object> get props => [name, amount,savings];

  SendMoneyEvent copyWith({
    String? name,
    double? amount,
    double? savings,
  }) {
    return SendMoneyEvent(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      savings: savings ?? this.savings,
    );
  }
}
