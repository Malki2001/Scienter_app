import 'package:flutter/material.dart';

class CustomAppbutton extends StatefulWidget {
  final IconData appIcon;
  final double iconSize;
  const CustomAppbutton({super.key, required this.appIcon, this.iconSize = 24.0});

  @override
  State<CustomAppbutton> createState() => _CustomAppbuttonState();
}

class _CustomAppbuttonState extends State<CustomAppbutton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.grey[200],
      ),
      onPressed: () {},
      child: Icon(
        widget.appIcon,
        color: Colors.black,
        size: widget.iconSize,
      ),
    );
  }
}
