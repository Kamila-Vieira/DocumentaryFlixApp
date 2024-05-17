import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final int? max;
  final RegExp? pattern;
  final String label;
  final String placeholder;

  const InputText({
    super.key,
    this.max,
    this.pattern,
    this.onChanged,
    required this.controller,
    required this.label,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 32),
          child: TextField(
            controller: controller,
            maxLength: max,
            style: Theme.of(context).textTheme.bodySmall,
            onChanged: onChanged,
            inputFormatters: pattern != null
                ? [
                    FilteringTextInputFormatter.allow(pattern!),
                  ]
                : null,
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: primaryColor),
              ),
              hintText: placeholder,
              fillColor: primaryColor,
              contentPadding: const EdgeInsets.only(
                  top: 14, bottom: 15, left: 16, right: 16),
            ),
          ),
        ),
      ],
    );
  }
}
