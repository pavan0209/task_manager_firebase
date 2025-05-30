import 'package:flutter/material.dart';

import 'package:task_manager_firebase/styles/index.dart';

class AppElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final bool disabled;

  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppStyles.appButtonStyle(context, disabled: disabled),
      onPressed: onPressed,
      child: Text(label, overflow: TextOverflow.ellipsis),
    );
  }
}
