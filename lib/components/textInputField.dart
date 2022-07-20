import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    this.keyboard,
    this.inputTextStytle,
    this.autocorrect = true,
    this.enableSuggestions = true,
    required this.inputDecoration,
    this.onChanged,
  }) : super(key: key);

  final bool autocorrect;
  final bool enableSuggestions;
  final TextInputType? keyboard;
  final TextStyle? inputTextStytle;
  final InputDecoration inputDecoration;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        onChanged: onChanged,
        style: inputTextStytle,
        keyboardType: keyboard,
        autocorrect: autocorrect,
        cursorColor: Colors.black,
        decoration: inputDecoration,
        enableSuggestions: enableSuggestions,
        cursorHeight: 20.0,
        cursorWidth: 1.5,
      ),
    );
  }
}
