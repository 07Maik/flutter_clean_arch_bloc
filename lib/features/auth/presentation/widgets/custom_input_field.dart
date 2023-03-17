import 'package:flutter/material.dart';

import 'package:flutter_clean_arch_bloc/shared/styles/input_decoration.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData? icon;

  const CustomInputField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecorations.defaultInputDecoration(
          hintText: hintText,
          labelText: label,
          prefixIcon: icon,
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }
}
