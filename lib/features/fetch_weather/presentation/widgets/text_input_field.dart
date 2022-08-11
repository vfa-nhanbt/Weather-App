import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  Function(String)? onSubmitted;

  TextInputField({
    Key? key,
    required this.controller,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      decoration: const InputDecoration(
        label: Text("CityName"),
        suffixIcon: Icon(Icons.search),
      ),
      onFieldSubmitted: onSubmitted,
      validator: (value) {
        if (value == null || value == "") {
          return "City name is required";
        }
        return null;
      },
    );
  }
}
