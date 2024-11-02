import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function() onTap;
  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.orange, // Text color
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontSize: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Set radius here
          ),
        ),
        child: Text(widget.title,
        style: const TextStyle(

          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
    );
  }
}
