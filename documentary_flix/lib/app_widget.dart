import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:documentary_flix/themes/main_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DocumentaryFlix',
      theme: mainTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
