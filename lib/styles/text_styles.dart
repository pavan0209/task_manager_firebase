import 'package:flutter/material.dart';
import 'package:task_manager_firebase/styles/index.dart';

class AppFontFamily {
  static const poppins = 'Poppins';
}

class AppStyles {
  static blackTitleLargeTextStyle() {
    return TextStyle(
      fontFamily: AppFontFamily.poppins,
      color: AppColors.black,
      fontSize: AppFontSize.titleLarge,
      fontWeight: FontWeight.w600,
    );
  }

  static greyBodySmallTextStyle() {
    return TextStyle(
      fontFamily: AppFontFamily.poppins,
      color: AppColors.grey,
      fontSize: AppFontSize.bodySmall,
      fontWeight: FontWeight.w500,
    );
  }

  static formLabelStyle() {
    return TextStyle(
      fontFamily: AppFontFamily.poppins,
      fontSize: AppFontSize.bodyMedium,
      fontWeight: FontWeight.w600,
      color: AppColors.black.withOpacity(0.7),
    );
  }

  static whiteBodyLargeBoldTextStyle() {
    return TextStyle(
      fontFamily: AppFontFamily.poppins,
      fontSize: AppFontSize.bodyLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    );
  }

  static blueBodySmallTextStyle() {
    return TextStyle(
      color: AppColors.blue,
      fontFamily: AppFontFamily.poppins,
      fontWeight: FontWeight.w600,
      fontSize: AppFontSize.bodySmall,
    );
  }

  static greenBodyMediumTextStyle() {
    return TextStyle(
      color: AppColors.green,
      fontFamily: AppFontFamily.poppins,
      fontSize: AppFontSize.bodyMedium,
    );
  }

  static redBodyMediumTextStyle() {
    return TextStyle(
      color: AppColors.red,
      fontFamily: AppFontFamily.poppins,
      fontSize: AppFontSize.bodyMedium,
    );
  }

  static appButtonStyle(BuildContext context, {bool? disabled}) {
    return ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 40),
      foregroundColor: AppColors.white,
      backgroundColor: disabled == true ? AppColors.grey.withOpacity(0.4) : AppColors.blue,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppRadius.standardRadius))),
      textStyle: whiteBodyLargeBoldTextStyle(),
    );
  }
}
