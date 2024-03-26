import 'package:flutter/material.dart';

class AppBarGeneral extends StatelessWidget implements PreferredSizeWidget {
  const AppBarGeneral({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
