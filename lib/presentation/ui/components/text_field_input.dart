import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final String Function(String? text) validate;
  TextFieldInput({required this.validate, this.label = "", this.controller});

  @override
  _TextFieldInputState createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: this.widget.controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: widget.label,
        ),
        validator: widget.validate,
        onChanged: (_) => _formKey.currentState?.validate(),
      ),
    );
  }
}
