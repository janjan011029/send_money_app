import 'package:flutter/material.dart';
import 'package:send_money_app/utils/mixins/shared_style.dart';

class TransactionHeader extends StatelessWidget with SharedTextStyles {
  const TransactionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: headerStyle.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
          InkWell(
            key: const Key('ViewAllKey'),
            onTap: onTap,
            child: Text(
              'View Transaction',
              style: underLineTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
