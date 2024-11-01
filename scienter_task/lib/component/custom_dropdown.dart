import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> dataList;
  final TextEditingController controller;
  const CustomDropdown(
      {super.key, required this.dataList, required this.controller});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.controller.text,
      decoration: InputDecoration(
        border: AppInputStyle.outlineInputBorder,
        focusedBorder: AppInputStyle.outlineInputBorder,
        hintText: "Select Your Country",
        labelText: "Select Your Country",
        hintStyle: AppInputStyle.hintTextStyle,
        labelStyle: AppInputStyle.labelTextStyle,
        floatingLabelStyle: AppInputStyle.floatingLabelStyle,
        // prefixIcon: AppInputStyle.quaIcon,
        errorBorder: AppInputStyle.inputErrorBorder,
      ),
      menuMaxHeight: 222,
      items: widget.dataList.map<DropdownMenuItem<String>>((String queValue) {
        return DropdownMenuItem<String>(
          value: queValue,
          child: SizedBox(
            width: 258,
            child: Text(
              queValue,
              style: const TextStyle(fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
      // dropdownColor: Colors.thirdPartyColor,
      onChanged: (String? newValue) {
        widget.controller.text = newValue!;
      },
      hint: const Text("Select your recover question"),
    );
  }
}
