part of '../messages.dart';

class _InfoDg extends StatelessWidget {
  const _InfoDg(
      {super.key, required this.title, required this.message, this.callback});

  final String title, message;
  final Function()? callback;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: SizedBox(width: 400, child: Text(title)),
        content: SizedBox(width: 400, child: Text(message)),
        actions: [
          TextButton(
            onPressed: callback ?? Navigator.of(context).pop,
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }
}
