import 'package:flutter/material.dart';

class EXT {}

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

extension PostFrameCallback on VoidCallback {
  void withPostFrameCallback() =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        this();
      });
}

extension StringExtensions on String {
  /// Capitatlize Words
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';

  /// CapitaizeAllWords
  String get allInCaps => toUpperCase();

  /// Capitatize First of Each word
  String get capitalizeFirstofEach =>
      split(' ').map((str) => str.capitalize).join(' ');

  /// SVG asset path
  String get svg => 'assets/images/svg/$this.svg';

  /// PNG asset path
  String get png => 'assets/images/png/$this.png';
}
