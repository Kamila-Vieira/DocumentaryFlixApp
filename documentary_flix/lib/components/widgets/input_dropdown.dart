import 'package:flutter/material.dart';

class InputDropdown extends StatelessWidget {
  final Function(String?) onChanged;
  final String? value;
  final String label;
  final List<DropdownMenuItem<String>> options;

  const InputDropdown({
    super.key,
    this.value,
    required this.onChanged,
    required this.label,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 32),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              iconSize: 0,
              isExpanded: true,
              value: value,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              elevation: 16,
              style: Theme.of(context).textTheme.bodySmall,
              dropdownColor: Theme.of(context).colorScheme.primary,
              onChanged: onChanged,
              items: options,
              hint: const Text('Animais, Terror...'),
            ),
          ),
        ),
      ],
    );
  }
}
