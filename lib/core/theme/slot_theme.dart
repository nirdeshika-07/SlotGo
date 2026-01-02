import 'package:flutter/material.dart';

import 'pallete.dart';

class SlotTheme{

  static _border([Color color = SlotPallete.borderColor]) => OutlineInputBorder(
      borderSide: BorderSide(
          color: color,
          width: 3
      ),
      borderRadius: BorderRadius.circular(10)
  );

  static TextStyle _bodyStyle([
    Color color = Colors.black,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w700,
  ]) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'Roboto'
    );
  }
  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: SlotPallete.backgroundColor,
      appBarTheme:const AppBarTheme(
          backgroundColor: SlotPallete.backgroundColor
      ),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: _border(),
          focusedBorder: _border(SlotPallete.gradient2)
      ),
      textTheme: TextTheme(
        displayMedium: _bodyStyle(),
      )
  );
}