import 'package:bachelorapp/src/constants/colors/color.dart';
import 'package:bachelorapp/src/constants/sizes/size.dart';
import 'package:flutter/material.dart';

class UElevatedButtonTheme{
  UElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: WhiteColor,
      backgroundColor: SecondaryColor,
      side: BorderSide(color: SecondaryColor),
      padding: EdgeInsets.all(buttonHeight),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: SecondaryColor,
      backgroundColor: WhiteColor,
      side: BorderSide(color: SecondaryColor),
      padding: EdgeInsets.all(buttonHeight),
    ),
  );
}