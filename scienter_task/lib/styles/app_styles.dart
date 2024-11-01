import 'package:flutter/material.dart';

class AppInputStyle {
  //obsecure character
  static String obscuringCharacter = '●';

  // border
  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black));

  static OutlineInputBorder inputErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red));

  // text style
  static TextStyle hintTextStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 14.0,
  );
  static TextStyle labelTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
  static TextStyle floatingLabelStyle = const TextStyle(
    color: Colors.black,
    fontSize: 18.0,
  );

  static TextStyle errorTextStyle = const TextStyle(
    color: Colors.red,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  // padding
  static EdgeInsets contentPadding =
  const EdgeInsets.symmetric(horizontal: 20, vertical: 15);
}