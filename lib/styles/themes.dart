import 'package:flutter/material.dart';
import 'package:task_manager_firebase/styles/index.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: false,
      fontFamily: AppFontFamily.poppins,
      primaryColor: AppColors.blue,
      dividerColor: AppColors.grey,
      buttonTheme: const ButtonThemeData(alignedDropdown: true),
      scaffoldBackgroundColor: AppColors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.blue,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(fontSize: AppFontSize.bodyMedium, color: AppColors.red, fontWeight: FontWeight.normal),
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(color: AppColors.grey),
        focusColor: AppColors.red,
        iconColor: AppColors.grey,
        suffixIconColor: AppColors.grey,
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.red, width: 0.5)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey.withOpacity(0.5), width: 0.5)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.red, width: 0.5)),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.normal),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: TextButton.styleFrom(
        side: BorderSide(color: AppColors.blue),
        minimumSize: const Size(100, 40),
        padding: const EdgeInsets.all(AppPadding.defaultPadding),
        foregroundColor: AppColors.blue,
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: AppColors.blue,
            minimumSize: const Size(120, 40),
            padding: const EdgeInsets.all(AppPadding.defaultPadding),
            elevation: 1,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
            textStyle: const TextStyle(
                fontSize: AppFontSize.bodyLarge, fontWeight: FontWeight.w600, fontFamily: AppFontFamily.poppins)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        shadowColor: AppColors.transparent,
        iconTheme: IconThemeData(color: AppColors.grey, size: 24.0),
        titleTextStyle:
            TextStyle(color: AppColors.black, fontSize: AppFontSize.titleSmall, fontFamily: AppFontFamily.poppins),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
