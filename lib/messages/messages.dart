import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/loading/loading_general.dart';

part 'dg/loading_dg.dart';
part 'dg/no_wifi_dg.dart';
part 'dg/info_dg.dart';

abstract class Messages {
  // Cargando
  static void showLoading(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const _LoadingDg(),
      );

  // No wifi
  static void noWifi(BuildContext context) =>
      showDialog(context: context, builder: (context) => const _NoWifiDg());

  // Mostrar información
  static void showInfo(BuildContext context,
          {String title = "Ups!",
          required String message,
          Function()? callback}) =>
      showDialog(
        context: context,
        builder: (context) =>
            _InfoDg(title: title, message: message, callback: callback),
      );
}
