import 'package:flutter/material.dart';
import 'package:send_money_app/features/savings/presentation/widgets/send_money_button.dart';
import 'package:send_money_app/utils/mixins/shared_colors.dart';
import 'package:send_money_app/utils/mixins/shared_style.dart';

class CardWidget extends StatelessWidget with SharedColors, SharedTextStyles {
  const CardWidget({
    super.key,
    required this.isHidden,
    required this.amount,
    required this.onTap,
    required this.sendMoney,
  });

  final bool isHidden;
  final double amount;
  final VoidCallback onTap;
  final VoidCallback sendMoney;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        gradient: gradientColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isHidden ? '*********645' : '546756755645',
                  style: cardNumberStyle,
                ),
                InkWell(
                  key: const Key('ShowHideMoneyKey'),
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      isHidden ? Icons.visibility_off : Icons.visibility,
                      color: const Color.fromARGB(255, 222, 176, 176),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                isHidden ? '₱ *****' : '₱ ${amount.toStringAsFixed(2)}',
                style: moneyStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Savings',
                  style: mediumTextStyle,
                ),
                SendMoneyButton(
                  key: const Key('SendMoneyKey'),
                  onTap: sendMoney,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
