import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({
    this.onChanged,
    this.controller,
    this.hintText,
    super.key,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      controller: controller,
      autofocus: true,
      onChanged: onChanged,
      maxLines: 5,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).primaryTextTheme.labelSmall,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        fillColor: Colors.grey.shade300,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade800,
            width: 0.6,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.indigo,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      keyboardType: TextInputType.text,
      style: Theme.of(context).primaryTextTheme.bodySmall,
    );
  }
}
