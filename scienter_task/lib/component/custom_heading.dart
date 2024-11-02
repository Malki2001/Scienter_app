import 'package:flutter/material.dart';

class CustomHeading extends StatefulWidget{
  final String title;

  const CustomHeading({super.key, required this.title});

  @override
  State<CustomHeading> createState() => _CustomHeadingState();
}

class _CustomHeadingState extends State<CustomHeading> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      // "Log In to Your Account",
      style: TextStyle(
        fontSize: 24,
        fontFamily:
        'PoetsenOne-Regular',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
