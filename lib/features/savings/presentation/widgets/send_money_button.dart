import 'package:flutter/material.dart';

class SendMoneyButton extends StatelessWidget {
  const SendMoneyButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Send Money',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward_outlined, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}