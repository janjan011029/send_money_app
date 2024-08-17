import 'package:flutter/material.dart';

mixin SharedColors {
  LinearGradient get gradientColor => const LinearGradient(
        colors: [
          Colors.lightBlue,
          Color.fromARGB(255, 11, 85, 149),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}
