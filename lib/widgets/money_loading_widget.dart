import 'package:flutter/material.dart';

class MoneyLoading extends StatelessWidget {
  const MoneyLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/gifs/loading.gif",
        height: 450,
        width: 450,
      ),
    );
  }
}
