import 'package:flutter/material.dart';

class BackgroundApp {
  static BoxDecoration get gradientBoxDecoration {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.indigoAccent,
          Colors.purple,
        ],
      ),
    );
  }
}
