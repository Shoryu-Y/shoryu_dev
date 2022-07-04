import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoryu_dev/ui/widget/button/filled_button.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton({
    super.key,
    required this.title,
    required this.path,
  });

  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      title: title,
      isTonal: true,
      onPressed: () => GoRouter.of(context).push(path),
    );
  }
}
