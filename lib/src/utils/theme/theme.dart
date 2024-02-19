import 'package:bachelorapp/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:bachelorapp/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:bachelorapp/src/utils/theme/widget_themes/text_theme.dart';
import 'package:bachelorapp/src/utils/theme/widget_themes/textfiel_theme.dart';
import 'package:flutter/material.dart';


class UAppTheme {
  UAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
    textTheme: UTextTheme.lightTextTheme,
    outlinedButtonTheme: UOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: UElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: UTextFormFieldTheme.lightInputDecorationTheme,

  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
    textTheme: UTextTheme.darkTextTheme,
    outlinedButtonTheme: UOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: UElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: UTextFormFieldTheme.darkInputSecorationTheme,
  );
}
