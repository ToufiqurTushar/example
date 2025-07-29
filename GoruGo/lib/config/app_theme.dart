import 'package:flutter/material.dart';

//app theme
ThemeData customLightTheme = ThemeData(
  primaryColor: Colors.green,
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: Color(0xFFFFFFFF),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  dividerColor: Colors.grey,
  focusColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardTheme: CardThemeData(
    color: Color(0xfff7faeb),
    elevation: 1,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    clipBehavior: Clip.antiAlias,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.green, // text & icon color
      side: const BorderSide(color: Colors.green, width: 1.5), // border
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // rounded corners
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.green
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    isDense: true,
    fillColor: Colors.white,
    labelStyle: TextStyle(color: Colors.grey[400]),
    hintStyle: TextStyle(color: Colors.grey[600]),
    floatingLabelStyle: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.w600,
    ),
    prefixIconColor: Colors.grey[500],
    suffixIconColor: Colors.grey[500],
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 0.5, color: Colors.green),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 0.5, color: Colors.green),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 0.5, color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 0.5, color: Colors.green),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 0.5, color: Colors.grey),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(color: Colors.green, width: 2),
    fillColor: MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.green;
      }
      return Colors.white;
    }),
    checkColor: MaterialStateProperty.all(Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
  ),
);

ThemeData customDarkTheme = customLightTheme.copyWith(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[800],
  scaffoldBackgroundColor: Color(0xFF222222),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  focusColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    hintStyle: TextStyle(color: Colors.white),
    prefixIconColor: Colors.grey[300],
    suffixIconColor: Colors.grey[300],
    labelStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelStyle: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.w600,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 0.5, color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 0.5, color: Colors.grey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 0.5, color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 0.5, color: Colors.grey),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 0.5, color: Colors.grey),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[800],
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardTheme: CardThemeData(
    color: Colors.grey[800],
    elevation: 1,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    clipBehavior: Clip.antiAlias,
  ),
  listTileTheme: const ListTileThemeData(
    textColor: Colors.white,
    style: ListTileStyle.list,
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    // You can customize other text styles here too
  ),
);

//app Size
final class AppSize {
  static double none = 0;
  static double xxxSmall = 1;
  static double xxSmall = 4;
  static double xSmall = 8;
  static double small = 12;
  static double normal = 16;
  static double medium = 20;
  static double large = 24;
  static double xLarge = 28;
  static double xxLarge = 32;
  static double xxxLarge = 36;
}
