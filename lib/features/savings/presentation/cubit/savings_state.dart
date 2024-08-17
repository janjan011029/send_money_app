// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'savings_cubit.dart';

class SavingsState extends Equatable {
  const SavingsState({
    this.isHidden = true,
    this.amount = 500,
    this.items = const [],
  });

  final bool isHidden;
  final double amount;
  final List<TransactionModel> items;

  @override
  List<Object> get props => [isHidden, amount, items];

  SavingsState copyWith({
    bool? isHidden,
    double? amount,
    List<TransactionModel>? items,
  }) {
    return SavingsState(
      isHidden: isHidden ?? this.isHidden,
      amount: amount ?? this.amount,
      items: items ?? this.items,
    );
  }
}
