import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const Color white = Colors.white;
const Color black = Colors.black;
const Color kPlanGreen = Color(0xFF1DA154);
const Color kPlanGrey = Color(0xFFD2D2D2);
const Color kPlanCardColor = Color(0xFFF1F4FB);

extension CustomThemeContext on BuildContext {
  ThemeData get themeData => ThemeData(
        textTheme: textTheme,
        primaryColor: white,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  TextTheme get textTheme => GoogleFonts.latoTextTheme(
        Theme.of(this).textTheme,
      );
}
