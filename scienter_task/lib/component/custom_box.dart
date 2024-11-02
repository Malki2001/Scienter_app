import 'package:flutter/material.dart';

class CustomBox extends StatefulWidget {
  final Image jobImage;
  final String jobTitle;
  const CustomBox({Key? key, required this.jobImage, required this.jobTitle}) : super(key: key);

  @override
  State<CustomBox> createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(8.0),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child:
                widget.jobImage,

              ),


            const SizedBox(height: 5.0),

            Expanded(
              flex: 1,
              child: Text(
                widget.jobTitle,
                style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.black87 , fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
