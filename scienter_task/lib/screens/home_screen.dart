import 'package:flutter/material.dart';
import 'package:scienter_task/component/custom_button.dart';
import 'package:scienter_task/component/main_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        appBar: AppBar(
          elevation: 0.0,
          // backgroundColor: Color.fromRGBO(66, 245, 191, 1),

          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromRGBO(120, 6, 84, 1)),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
        ),
        children: [CustomButton(title: "Back", onTap: () {})]);
  }
}
