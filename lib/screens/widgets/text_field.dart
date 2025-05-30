import 'package:flutter/material.dart';
import 'package:task_manager_firebase/styles/index.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextStyle? style;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String obscuringCharacter;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? label;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? filled;
  final Color? fillColor;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  const AppTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.hintStyle,
    this.style,
    this.autofocus,
    this.keyboardType,
    this.obscureText,
    this.obscuringCharacter = '',
    this.label,
    this.labelText,
    this.labelStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.filled,
    this.fillColor,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: style ?? AppStyles.formLabelStyle(),
      autofocus: autofocus ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      obscuringCharacter: obscuringCharacter,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        label: label,
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.formLabelStyle(),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText ?? '',
        hintStyle: hintStyle,
        filled: filled,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.only(left: AppPadding.largePadding, top: AppPadding.defaultPadding),
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.standardRadius),
              borderSide: BorderSide(color: AppColors.white),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.standardRadius),
              borderSide: BorderSide(color: AppColors.white),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.standardRadius),
              borderSide: BorderSide(color: AppColors.white),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
              borderRadius: BorderRadius.circular(AppRadius.standardRadius),
            ),
      ),
    );
  }
}
