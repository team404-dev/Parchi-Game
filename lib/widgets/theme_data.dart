import 'package:flutter/material.dart';

final Map<int, Color> _primarySwatchColor = {
  50: Color.fromRGBO(82, 5, 123, 0.1),
  100: Color.fromRGBO(82, 5, 123, 0.2),
  200: Color.fromRGBO(82, 5, 123, 0.3),
  300: Color.fromRGBO(82, 5, 123, 0.4),
  400: Color.fromRGBO(82, 5, 123, 0.5),
  500: Color.fromRGBO(82, 5, 123, 0.6),
  600: Color.fromRGBO(82, 5, 123, 0.7),
  700: Color.fromRGBO(82, 5, 123, 0.8),
  800: Color.fromRGBO(82, 5, 123, 0.9),
  900: Color.fromRGBO(82, 5, 123, 1)
};

final ThemeData AppTheme = ThemeData(
  primarySwatch: MaterialColor(0xFF52057B, _primarySwatchColor),
  accentColor: Color.fromRGBO(137, 44, 220, 1),
  scaffoldBackgroundColor: _primarySwatchColor[700],
  fontFamily: 'Poppins',
);