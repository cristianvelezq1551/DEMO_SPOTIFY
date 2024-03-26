import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TffGeneral extends StatelessWidget {
  const TffGeneral(
      {super.key,
      this.controller,
      this.hintText,
      this.textInputType = TextInputType.text,
      this.validator,
      this.enabled = true,
      this.readOnly = false,
      this.onTap,
      this.inputFormatters,
      this.suffixIcon,
      this.onlyDigits = false,
      this.focusNode});

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool enabled, readOnly;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final bool onlyDigits;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.amber,
      inputFormatters:
          onlyDigits ? [FilteringTextInputFormatter.digitsOnly] : null,
      enabled: enabled,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onSurface),
        ),
        fillColor: Theme.of(context).colorScheme.surface,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
