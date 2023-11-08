import 'package:flutter/material.dart';

TextFormField textFormField(
  String hintText, {
  required void Function(String) onTextchanged,
  bool obscureText = false,
}) {
  return TextFormField(
    style: TextStyle(color: Colors.white),
    validator: (data) {
      if (data!.isEmpty) {
        return 'value is wrong';
      }
    },
    obscureText: obscureText,
    onChanged: (data) => onTextchanged(data),
    decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
        label: Text(
          hintText,
          style: const TextStyle(color: Colors.white),
        )),
  );
}

void closeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
