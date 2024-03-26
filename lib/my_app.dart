import 'package:flutter/material.dart';

import 'routes/pages.dart';
import 'routes/routes.dart';
import 'theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo spotify',
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.initial,
      routes: Pages.routes,
      theme: MyTheme.dark,
    );
  }
}
