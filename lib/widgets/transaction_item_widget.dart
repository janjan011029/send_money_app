import 'package:flutter/material.dart';
import 'package:send_money_app/utils/mixins/shared_style.dart';

class TransactionItem extends StatelessWidget with SharedTextStyles {
  const TransactionItem({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
  });

  final String title;
  final String date;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Text(title[0]),
      ),
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(
        '-₱$amount',
        style: moneyRedTextStyle,
      ),
    );
  }
}
