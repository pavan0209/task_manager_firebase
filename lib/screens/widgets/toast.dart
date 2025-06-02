import 'package:flutter/material.dart';
import 'package:task_manager_firebase/styles/index.dart';

class AppToast {
  static showSuccess(BuildContext context, String message, {int durationInSeconds = 2}) {
    var snackBar = SnackBar(
      content: Text(message, style: AppStyles.greenBodyMediumTextStyle()),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: durationInSeconds),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.standardRadius)),
    );

    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showError(BuildContext context, String message, {int durationInSeconds = 2}) {
    var snackBar = SnackBar(
      content: Text(message, style: AppStyles.greenBodyMediumTextStyle()),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: durationInSeconds),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.standardRadius)),
    );

    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
