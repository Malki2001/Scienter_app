import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scienter_task/component/custom_divider.dart';
import 'package:scienter_task/component/custom_heading.dart';
import 'package:scienter_task/screens/login_screen.dart';
import 'package:scienter_task/screens/signup_screen.dart';
import '../component/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img3.jpg',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            const CustomHeading(title: "Welcome Back !"),
            const SizedBox(height: 20),
            const CustomOutlinedButton(
              logo: FontAwesomeIcons.google,
              logoTitle: 'Continue with Google',
              iconSize: 18.0,
            ),
            const SizedBox(height: 10),
            const CustomOutlinedButton(
              logo: Icons.apple_outlined,
              logoTitle: 'Continue with Apple',
            ),
            const SizedBox(height: 20),
            const CustomDivider(),
            const SizedBox(height: 10),
            CustomButton(
                title: "Sign In with Password",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final IconData? logo;
  final String logoTitle;
  final double iconSize;

  const CustomOutlinedButton({
    super.key,
    this.logo,
    required this.logoTitle,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              logo,
              color: Colors.black,
              size: iconSize,
            ),
            const SizedBox(width: 10),
            Text(
              logoTitle,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
