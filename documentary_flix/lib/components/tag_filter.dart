import 'package:flutter/material.dart';

class TagFilter extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color color;

  const TagFilter({
    super.key,
    this.onPressed,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
        height: 32,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
            backgroundColor: MaterialStateProperty.all<Color>(color),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 7, bottom: 6),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}
