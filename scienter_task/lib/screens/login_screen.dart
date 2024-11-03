import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scienter_task/component/custom_appbutton.dart';
import 'package:scienter_task/component/custom_button.dart';
import 'package:scienter_task/component/custom_divider.dart';
import 'package:scienter_task/component/custom_heading.dart';
import 'package:scienter_task/component/custom_textfield.dart';
import 'package:scienter_task/component/main_layout.dart';
import 'package:scienter_task/screens/home_screen.dart';
import 'package:scienter_task/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final specialDigitRegex = RegExp(r'[!@#$%^&()_+{}\[\]:;<>,.?~\\-]');
  final numericRegex = RegExp(r'[0-9]');

  String? onEmailChanged(String? email) {
    if (email!.isEmpty) {
      return "* Email is required.";
    } else if (!emailRegExp.hasMatch(email)) {
      return "* Email is invalid.";
    } else {
      return null;
    }
  }

  String? onPasswordChanged(String? password) {
    if (password!.isEmpty) {
      return "* Password is required.";
    }
    if (password.length <= 8 && password.length >= 30) {
      return "* Password must be 6 characters long.";
    } else if (!numericRegex.hasMatch(password)) {
      return "* Password must contain at least one number.";
    } else if (!specialDigitRegex.hasMatch(password)) {
      return '* Password must contain at least one special digit.';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ),
      children: [
        Image.asset(
          'assets/images/icon_3.png',
          width: 180,
          height: 180,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        const CustomHeading(title: " Log In to Your Account"),
        const SizedBox(height: 20),
        Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                    controller: emailController,
                    labelText: 'Username',
                    hintText: 'Enter Your Username',
                    validator: (value) => onEmailChanged(value),
                    icon: const Icon(Icons.email)),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: passwordController,
                    isObscure: true,
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    validator: (value) => onPasswordChanged(value),
                    icon: const Icon(Icons.lock)),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot the password",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                    title: "Sign In",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      }
                    }),
              ],
            )),
        const SizedBox(height: 10),
        const CustomDivider(),
        const SizedBox(height: 10),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAppbutton(appIcon: Icons.facebook),
            SizedBox(width: 30),
            CustomAppbutton(
              appIcon: FontAwesomeIcons.google,
              iconSize: 18,
            ),
            SizedBox(width: 30),
            CustomAppbutton(appIcon: Icons.apple_outlined),
          ],
        ),
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
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
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
    );
  }
}
