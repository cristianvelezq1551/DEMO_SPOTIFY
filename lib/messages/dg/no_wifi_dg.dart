part of '../messages.dart';

class _NoWifiDg extends StatelessWidget {
  const _NoWifiDg({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: const Text(
          "Sin conexión a internet",
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          height: 180,
          width: 180,
          child: Icon(Icons.wifi_off_outlined)
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }
}
