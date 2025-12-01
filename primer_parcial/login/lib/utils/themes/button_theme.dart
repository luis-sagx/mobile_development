import 'package:flutter/material.dart';
import 'schema_color.dart';

class ButtonThemeApp {
  static final primaryButtonStyle = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: SchemaColor.primaryColor,
      foregroundColor: SchemaColor.lightTextColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  static final secondaryButtonStyle = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: SchemaColor.darkTextColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      side: BorderSide(color: SchemaColor.secondaryColor, width: 2),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  );
}
