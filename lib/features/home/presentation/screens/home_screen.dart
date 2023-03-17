import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_clean_arch_bloc/features/auth/domain/models/user_model.dart';
import 'package:flutter_clean_arch_bloc/features/auth/presentation/bloc/auth_bloc.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  late AuthBloc authBloc;
  late UserModel user;

  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    user = (authBloc.state as AuthLoaded).user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                authBloc.add(OnClickLogout());
                context.go("/login");
              },
              tooltip: "log out",
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("Hi ${user.firstName} ${user.lastName}"),
      ),
    );
  }
}
