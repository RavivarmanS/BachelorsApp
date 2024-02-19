import 'package:bachelorapp/src/constants/colors/color.dart';
import 'package:bachelorapp/src/constants/sizes/size.dart';
import 'package:flutter/material.dart';

class UOutlinedButtonTheme{
  UOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: SecondaryColor,
      side: BorderSide(color: SecondaryColor),
      padding: EdgeInsets.all(buttonHeight),
    ),
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: WhiteColor,
      side: BorderSide(color: WhiteColor),
      padding: EdgeInsets.all(buttonHeight),
    ),
  );
}