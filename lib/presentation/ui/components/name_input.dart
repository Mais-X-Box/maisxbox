import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final String nameLabel;
  final TextEditingController? controller;
  final Stream<String> nameErrorStream;
  final Function(String) validateName;
  NameInput({required this.nameErrorStream, required this.validateName, this.nameLabel = "Seu Nome", this.controller});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: this.nameErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          controller: this.controller,
          decoration: InputDecoration(
            labelText: nameLabel,
            errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
          ),
          keyboardType: TextInputType.name,
          onChanged: this.validateName,
        );
      },
    );
  }
}
