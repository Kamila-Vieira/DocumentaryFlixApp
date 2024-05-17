import 'package:flutter/material.dart';
import 'package:documentary_flix/themes/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: ThemeColors.headerBackground,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 58),
        child: Image.asset(
          'assets/images/logo-main.png',
          height: 30,
          //width: 188,
        ),
      ),
    );
  }
}
