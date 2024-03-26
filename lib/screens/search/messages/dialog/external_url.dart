part of '../search_messages.dart';

class _ExternalUrlDialog extends StatefulWidget {
  const _ExternalUrlDialog({super.key, required this.url, required this.title});

  final String url;
  final String title;

  @override
  State<_ExternalUrlDialog> createState() => _ExternalUrlDialogState();
}

class _ExternalUrlDialogState extends State<_ExternalUrlDialog> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarGeneral(title: widget.title),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
