import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  const FilledButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.minWidth = 200,
    this.isTonal = false,
  });

  final String title;
  final VoidCallback onPressed;
  final double minWidth;
  final bool isTonal;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: isTonal
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          onPrimary: isTonal
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSecondary,
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
