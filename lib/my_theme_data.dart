import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/app_colors.dart';

class MyThemeData {
  static final lightMode = ThemeData(
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
     ),
    scaffoldBackgroundColor: AppColors.backgroundLightColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
          fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
        ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.blackLightColor,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.blackLightColor,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: AppColors.blackLightColor,
      ),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: AppColors.primaryColor,
      showUnselectedLabels: false,
      unselectedItemColor: AppColors.greenColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
          side: BorderSide(
            color: AppColors.whiteColor,
            width: 4,
          ),
      ),
    ),
  );
  static final darkMode = ThemeData(
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.blackDarkColor,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w300,
          color: AppColors.whiteColor,
      ),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: AppColors.backgroundDarkColor,
      showUnselectedLabels: false,
      unselectedItemColor: AppColors.greenColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
        side: BorderSide(
          color: AppColors.whiteColor,
          width: 4,
        ),
      ),
    ),
  );
}
