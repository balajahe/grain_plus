import 'package:flutter/material.dart';

class AppTheme {
  static const loginBackgroundColor = Color(0x00729fcf);
  static const homeBackgroundColor = Color(0x00729fcf);
  static final buyButtonStyle = TextButton.styleFrom(backgroundColor: Colors.green);
  static final sellButtonStyle = TextButton.styleFrom(backgroundColor: Colors.red);
  static final commandButtonStyle = TextButton.styleFrom(visualDensity: VisualDensity.comfortable);
}

final themeData = ThemeData(
  visualDensity: VisualDensity.compact,
  primarySwatch: Colors.green,
);
