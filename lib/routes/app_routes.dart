import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_clean_arch_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_clean_arch_bloc/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_clean_arch_bloc/features/home/presentation/screens/home_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreenPage(),
    ),
  ],
  redirect: (context, state) {
    final state = context.read<AuthBloc>().state;

    return state is! AuthLoaded ? "/login" : null;
  },
);
