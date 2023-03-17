import 'package:flutter/material.dart';

import 'package:flutter_clean_arch_bloc/shared/ui_constants.dart';

class InputDecorations {
  static InputDecoration defaultInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                color: const Color(UIConstants.borderColorField),
              ));
  }
}
