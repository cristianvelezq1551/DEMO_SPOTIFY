import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

abstract class MyTheme {
  static const FlexScheme _scheme = FlexScheme.deepPurple;
  static ThemeData get _baseDark => FlexThemeData.dark(
      surface: const Color.fromARGB(255, 31, 31, 31),
      scheme: _scheme,
      fontFamily: 'Poppins',
      useMaterial3: true);

  static ThemeData get dark => _baseDark.copyWith(
        appBarTheme: _appBarTheme,
        bottomSheetTheme: _bottomTheme,
        inputDecorationTheme: _inputTheme(theme: _baseDark),
        dividerTheme: _dividerTheme,
      );

  // Divider
  static DividerThemeData get _dividerTheme =>
      const DividerThemeData(thickness: .5);

  // App bar theme
  static AppBarTheme get _appBarTheme =>
      const AppBarTheme(elevation: 0, centerTitle: false);

  // Bottom theme sheet
  static BottomSheetThemeData get _bottomTheme => const BottomSheetThemeData(
      elevation: 10,
      modalElevation: 10,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))));

  // Input theme
  static InputDecorationTheme _inputTheme({required ThemeData theme}) =>
      InputDecorationTheme(
        filled: true,
        fillColor: theme.hoverColor,
        border: _border(),
        errorBorder: _border(
            side: BorderSide(color: theme.colorScheme.error, width: 1.5)),
      );

  // Border
  static InputBorder _border({BorderSide? side}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: side ?? const BorderSide(color: Colors.transparent));
}
