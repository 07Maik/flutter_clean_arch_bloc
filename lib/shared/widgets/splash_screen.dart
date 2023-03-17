import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FlutterLogo(size: 120),
          SizedBox(height: 20),
          Text(
            'Loading....',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    ));
  }
}
