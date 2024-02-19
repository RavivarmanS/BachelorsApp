import 'package:bachelorapp/src/constants/colors/color.dart';
import 'package:flutter/material.dart';


class UTextFormFieldTheme {
  UTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: SecondaryColor,
        floatingLabelStyle: TextStyle(
          color: SecondaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2,color: SecondaryColor),
        )
      );

  static InputDecorationTheme darkInputSecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: PrimaryColor,
          floatingLabelStyle: TextStyle(
            color: PrimaryColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2,color: PrimaryColor),
          )
      );
}