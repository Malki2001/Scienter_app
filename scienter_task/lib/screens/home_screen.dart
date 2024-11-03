import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scienter_task/component/custom_box.dart';
import 'package:scienter_task/component/custom_button.dart';
import 'package:scienter_task/component/custom_searchbar.dart';
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
          backgroundColor: Colors.white,
          title: const Text(
            "Home",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('assets/images/icon_3.png',
                  width: 40, height: 40),
            )
          ],
        ),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchbar(),
              const SizedBox(height: 15.0),
              Column(
                children: [
                  Row(
                    children: [
                      CustomBox(
                          jobImage:
                              Image.asset("assets/images/category/c9.jpg"),
                          jobTitle: ' E-commerce'),
                      const SizedBox(width: 8.0),
                      CustomBox(
                          jobImage:
                              Image.asset("assets/images/category/c5.jpg"),
                          jobTitle: 'Technology & IT'),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      CustomBox(
                          jobImage:
                              Image.asset("assets/images/category/c11.jpg"),
                          jobTitle: 'Healthcare & Wellness'),
                      const SizedBox(width: 8.0),
                      CustomBox(
                          jobImage:
                              Image.asset("assets/images/category/c12.jpg"),
                          jobTitle: 'Education & Training'),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      CustomBox(
                          jobImage:
                              Image.asset("assets/images/category/c10.jpg"),
                          jobTitle: 'Food & Beverage'),
                      const SizedBox(width: 8.0),
                      CustomBox(
                          jobImage:
                              Image.asset("assets/images/category/c13.jpg"),
                          jobTitle: 'Financial Services'),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 15.0),
          CustomButton(title: "Continue", onTap: () {})
        ]);
  }
}
