import 'package:flutter/material.dart';
import 'package:send_money_app/utils/mixins/shared_colors.dart';
import 'package:send_money_app/utils/mixins/shared_style.dart';

class CustomButton extends StatelessWidget with SharedColors, SharedTextStyles {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradientColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
        ),
        child: Text(
          title,
          style: mediumTextStyle,
        ),
      ),
    );
  }
}
