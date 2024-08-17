import 'package:flutter/material.dart';

mixin SharedTextStyles {
  TextStyle get headerStyle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  TextStyle get mediumTextStyle => const TextStyle(
        fontSize: 16,
        color: Colors.white,
      );

  TextStyle get moneyStyle => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  TextStyle get cardNumberStyle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  TextStyle get underLineTextStyle => const TextStyle(
        fontSize: 15,
        decoration: TextDecoration.underline,
      );

  TextStyle get moneyRedTextStyle => const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      );
}
