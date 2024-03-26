import 'package:flutter/material.dart';

class EmptyPlayTrack extends StatelessWidget {
  const EmptyPlayTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(10)),
      child: const Icon(Icons.play_disabled),
    );
  }
}
