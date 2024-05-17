import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color? background;

  const Button({
    super.key,
    this.background,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 10, horizontal: 9)),
        backgroundColor: MaterialStateProperty.all<Color>(
            background ?? Theme.of(context).colorScheme.primary),
      ),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
