import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnGeneral extends StatefulWidget {
  const BtnGeneral({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.textColor = Colors.white,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? color, textColor;

  @override
  State<BtnGeneral> createState() => _BtnGeneralState();
}

class _BtnGeneralState extends State<BtnGeneral> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      minSize: 10,
      color: widget.color ?? theme.colorScheme.primary,
      onPressed: widget.onPressed,
      child: Text(widget.text, style: TextStyle(color: widget.textColor)),
    );
  }
}
