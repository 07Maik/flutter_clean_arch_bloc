import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_clean_arch_bloc/shared/ui_constants.dart';

import '../bloc/auth_bloc.dart';

class CustomButtonLogin extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final int color;

  const CustomButtonLogin({
    super.key,
    required this.text,
    required this.function,
    this.color = UIConstants.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, AuthLoading?>(
      selector: (state) {
        return state is AuthLoaded || state is AuthLoading
            ? AuthLoading()
            : null;
      },
      builder: (context, state) {
        return ElevatedButton(
            onPressed: state == null ? () => function() : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(color),
              disabledBackgroundColor: Color(color).withOpacity(0.7),
            ),
            child: state == null
                ? Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  )
                : const CircularProgressIndicator(
                    color: Colors.white,
                  ));
      },
    );
  }
}
