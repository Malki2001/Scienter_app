import 'package:flutter/material.dart';

class CustomSearchbar extends StatefulWidget {
  const CustomSearchbar({Key? key}) : super(key: key);

  @override
  State<CustomSearchbar> createState() => _CustomSearchbarState();
}

class _CustomSearchbarState extends State<CustomSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search business category...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),

          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        ),
        style: const TextStyle(color: Colors.black),
        onSubmitted: (query) {

        },
      ),
    );
  }
}
