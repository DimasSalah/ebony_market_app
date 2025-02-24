import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/constant.dart';
import 'custom_themes/appbar_theme.dart';

class GAppTheme {
  GAppTheme._();

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: GColors.white,
      brightness: Brightness.light,
      primary: GColors.primary,
      onPrimary: GColors.white,
      secondary: GColors.white,
      onTertiary: GColors.white,
      surface: GColors.white,
      onSurface: GColors.black,
    ),
    useMaterial3: true,
    
    fontFamily: GoogleFonts.poppins().fontFamily,
    disabledColor: GColors.grey,
    brightness: Brightness.light,
    primaryColor: GColors.primary,
    scaffoldBackgroundColor: GColors.backgroundColor,
    appBarTheme: GAppBarTheme.lightAppBarTheme,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color.fromARGB(255, 146, 186, 255),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: GColors.white,
      headerBackgroundColor: GColors.primary,
      headerForegroundColor: GColors.white,
      dayOverlayColor:
          WidgetStateProperty.all(GColors.primary.withValues(alpha: 0.3)),
      todayBackgroundColor: WidgetStateProperty.all(Colors.transparent),
      todayForegroundColor: WidgetStateProperty.all(GColors.primary),
      todayBorder: BorderSide(color: GColors.primary, width: 1),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: GColors.white,
      hourMinuteTextColor: GColors.black,
      hourMinuteColor: GColors.softGrey,
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      dialBackgroundColor: GColors.primary.withValues(alpha: 0.3),
      dialHandColor: GColors.primary,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(GColors.white),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: GColors.grey,
    brightness: Brightness.dark,
    primaryColor: GColors.primary,
    scaffoldBackgroundColor: GColors.black,
    appBarTheme: GAppBarTheme.darkAppBarTheme,
  );
}
