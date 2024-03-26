import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingGeneral extends StatelessWidget {
  const LoadingGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.colorScheme.onPrimary,
      ),
      child: CupertinoActivityIndicator(color: theme.colorScheme.primary),
    );
  }
}
