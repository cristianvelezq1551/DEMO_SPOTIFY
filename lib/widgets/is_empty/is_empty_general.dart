import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IsEmptyGeneral extends StatelessWidget {
  const IsEmptyGeneral({super.key, required this.icon, required this.text});

  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 150,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(height: 20),
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
