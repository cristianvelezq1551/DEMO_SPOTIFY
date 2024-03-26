import 'package:flutter/material.dart';

class PlayTrack extends StatelessWidget {
  final void Function()? onTap;

  const PlayTrack({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(10)),
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}
