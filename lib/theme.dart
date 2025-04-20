import 'package:flutter/material.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'shabnam'),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
    ),
    scaffoldBackgroundColor: Colors.white, // پس‌زمینه سفید
    colorScheme: const ColorScheme.light(
      primary: Colors.blue, // رنگ اصلی
      surface: Colors.white, // سطح سفید
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // تغییر به ThemeData.dark()
    textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'shabnam'),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900], // رنگ تیره‌تر
      foregroundColor: Colors.white,
      elevation: 1,
    ),
    scaffoldBackgroundColor: Colors.grey[900], // پس‌زمینه تیره
    colorScheme: const ColorScheme.dark(
      primary: Colors.blueAccent, // رنگ اصلی
      surface: Colors.grey, // سطح تیره
      background: Colors.black87, // پس‌زمینه مشکی
    ),
    cardTheme: CardTheme(
      color: Colors.grey[800], // رنگ کارت تیره
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.grey[800], // رنگ دیالوگ تیره
    ),
  );
}
