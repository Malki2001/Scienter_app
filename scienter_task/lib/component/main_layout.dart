import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final List<Widget> children;
  final AppBar appBar;
  final bool isLoading;

  const MainLayout({
    super.key,
    required this.children,
    required this.appBar,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: height,
                width: width,
                margin: const EdgeInsets.all(17.0),
                child: Opacity(
                  opacity: isLoading ? 0.4 : 1.0,
                  child: Column(
                    children: children,
                  ),
                ),
              ),
            ),
            if (isLoading)
              Container(
                color: Colors.grey.withOpacity(0.4),
                child: const Center(
                  child:
                      Text(
                        "Please wait...",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),


                ),
              ),
          ],
        ),
      ),
    );
  }
}
