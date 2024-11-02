import 'package:flutter/material.dart';

class CustomAppbutton extends StatefulWidget {
  final IconData appIcon;
  final double iconSize;
  const CustomAppbutton({Key? key, required this.appIcon,  this.iconSize = 24.0}) : super(key: key);

  @override
  State<CustomAppbutton> createState() => _CustomAppbuttonState();
}

class _CustomAppbuttonState extends State<CustomAppbutton> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
        backgroundColor: Colors.grey[200],
      ),
      onPressed: () {},
      child: Icon(widget.appIcon, color: Colors.black, size: widget.iconSize,),
    );
  }
}
