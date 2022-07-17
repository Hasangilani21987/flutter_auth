import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    this.keyboard,
    this.inputTextStytle,
    this.autocorrect = true,
    this.enableSuggestions = true,
    required this.inputController,
    required this.inputDecoration,
  }) : super(key: key);

  final bool autocorrect;
  final bool enableSuggestions;
  final TextInputType? keyboard;
  final TextStyle? inputTextStytle;
  final InputDecoration inputDecoration;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        style: inputTextStytle,
        keyboardType: keyboard,
        autocorrect: autocorrect,
        controller: inputController,
        cursorColor: Colors.black,
        decoration: inputDecoration,
        enableSuggestions: enableSuggestions,
        cursorHeight: 20.0,
        cursorWidth: 1.5,
      ),
    );
  }
}
