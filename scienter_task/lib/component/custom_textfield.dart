import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?) validator;
  final Widget icon;
  final bool isObscure;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      required this.validator,
      required this.icon,
      this.isObscure = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isObscure? _obscurePassword : false,
      obscuringCharacter: AppInputStyle.obscuringCharacter,
      decoration: InputDecoration(
        border: AppInputStyle.outlineInputBorder,
        focusedBorder: AppInputStyle.outlineInputBorder,
        contentPadding: AppInputStyle.contentPadding,
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: AppInputStyle.hintTextStyle,
        labelStyle: AppInputStyle.labelTextStyle,
        floatingLabelStyle: AppInputStyle.floatingLabelStyle,
        prefixIcon: widget.icon,
        errorBorder: AppInputStyle.inputErrorBorder,
        suffixIcon: widget.isObscure
            ? IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              )
            : const SizedBox(),
      ),
    );
  }
}
