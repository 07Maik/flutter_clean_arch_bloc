import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_clean_arch_bloc/shared/widgets/indicador_activity.dart';
import 'package:flutter_clean_arch_bloc/shared/widgets/splash_screen.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/custom_button_login.dart';
import '../widgets/custom_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late bool isClickLogin;

  @override
  void initState() {
    //data of example to use API
    _emailController = TextEditingController(text: "kminchelle");
    _passwordController = TextEditingController(text: "0lelplR");
    isClickLogin = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoaded) {
          context.go("/");
        }
      },
      builder: (context, state) {
        //Added this logic to load SplashScreen when the app is starting up
        if (state is AuthInitial || (!isClickLogin && state is AuthLoaded)) {
          return const SplashScreen();
        }

        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  title(),
                  const SizedBox(height: 20.0),
                  emailField(),
                  const SizedBox(height: 20.0),
                  passwordField(),
                  const SizedBox(height: 20.0),
                  buttonLogin(context)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Text title() {
    return const Text(
      'Login',
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  CustomInputField emailField() {
    return CustomInputField(
      controller: _emailController,
      hintText: "Email",
      label: "Email",
      icon: Icons.person,
    );
  }

  CustomInputField passwordField() {
    return CustomInputField(
      controller: _passwordController,
      hintText: "Password",
      label: "Password",
      icon: Icons.lock,
    );
  }

  CustomButtonLogin buttonLogin(BuildContext context) {
    return CustomButtonLogin(
      text: "Login",
      function: () {
        if (!_formKey.currentState!.validate()) return;

        ActivityIndicator();

        isClickLogin = true;

        context.read<AuthBloc>().add(
              OnClickLogin(
                  username: _emailController.text,
                  password: _passwordController.text),
            );
      },
    );
  }
}
