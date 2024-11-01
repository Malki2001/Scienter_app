import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final List<Widget> children;
  final AppBar appBar;
  final bool isLoading;
  const MainLayout(
      {super.key,
      required this.children,
      required this.appBar,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Stack(
          children: [
            isLoading
                ? Container(
                    height: height,
                    width: width,
                    color: Colors.grey.withOpacity(0.4),
                    child: Center(
                      child: const SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          )),
                    ))
                : const SizedBox(),
            SingleChildScrollView(
              child: Container(
                height: height,
                width: width,
                margin: const EdgeInsets.all(17.0),
                child: Column(
                  children: children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
