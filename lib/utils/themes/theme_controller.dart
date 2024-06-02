import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

/// A class to control the application theme (light or dark).
class ThemeController {
  static double defaultPadding = 20.pt;
  static double defaultFieldHeight = 60.pt;
  static double defaultFieldRadius = 10.pt;
  static final defaultShadow = [
    const BoxShadow(
        color: Color.fromRGBO(57, 90, 184, 0.1),
        blurRadius: 4,
        offset: Offset(
          0,
          3,
        ))
  ];

  /// The current theme mode of the application.
  ThemeMode themeMode = ThemeMode.light;

  /// Switches the theme mode between light and dark.
  void switchThemeMode() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  /// The light theme data for the application.
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryTextTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: Color(0xFF000000),
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        color: Color(0xFF383C40),
        fontSize: 17,
        fontWeight: FontWeight.w300,
      ),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
      color: Color(0xFFA4A9AF),
      fontWeight: FontWeight.w400,
      fontSize: 17,
    )),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.white,
    ),
    hintColor: const Color.fromRGBO(164, 169, 175, 1),
    primaryColor: const Color(0xFFF75F55),
    scaffoldBackgroundColor: const Color.fromRGBO(248, 248, 248, 1),
  );

  /// The dark theme data for the application.
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black.withOpacity(0.5),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
        .copyWith(brightness: Brightness.dark),
  );
}
