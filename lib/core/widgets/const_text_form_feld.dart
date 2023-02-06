import 'package:flutter/material.dart';

TextFormField textFormField({
  required TextEditingController controller,
  double? fontSize,
  required String labeltext,
  Color? labelcolor = Colors.grey,
  required String? Function(dynamic) validator,
  TextInputType? keyboardType = TextInputType.emailAddress,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    keyboardType: keyboardType,
    style: TextStyle(fontSize: fontSize, color: Colors.black),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(15.0),
      ),
      label: Text(
        labeltext,
        style: TextStyle(color: labelcolor),
      ),
      filled: true,
      fillColor: Colors.white,
      // contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(15.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(15.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
  );
}
