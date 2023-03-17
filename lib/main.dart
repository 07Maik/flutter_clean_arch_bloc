import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_clean_arch_bloc/routes/app_routes.dart';
import 'package:flutter_clean_arch_bloc/shared/themes/theme.dart';
import 'package:flutter_clean_arch_bloc/core/service_locator.dart'
    as service_locator;

import 'package:flutter_clean_arch_bloc/features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await service_locator.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: CustomTheme.theme(),
      ),
    );
  }
}
