import 'package:flutter/material.dart';
import 'package:scienter_task/component/custom_button.dart';
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
    if (password.length <= 8 && password.length>=30) {
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
        // backgroundColor: Color.fromRGBO(66, 245, 191, 1),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromRGBO(120, 6, 84, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      children: [
        const SizedBox(height: 80),

        CustomHeading(title: " Log In to Your Account"),

        const SizedBox(height: 50),

        Form(
            key: formKey ,
            child: Column(
          children: [
            CustomTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter Your Email',
                validator: (value) => onEmailChanged(value),
                icon: const Icon(Icons.email)),

            SizedBox(height: 25),

            CustomTextField(
                controller: passwordController,
                isObscure: true,
                labelText: 'Password',
                hintText: 'Enter Your Password',
                validator: (value) => onPasswordChanged(value),
                icon: const Icon(Icons.lock)),

            SizedBox(height: 10), // Add space before the Facebook button

            CustomButton(title: "Sign In", onTap: () {
              if(formKey.currentState! .validate()){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            }),
          ],
        )),

        // SizedBox(height: 8),

        Text(
          "Forgot the password",
          style: TextStyle(
            color: Color.fromRGBO(120, 6, 84, 1),
          ),
        ),
        // Add space before the Facebook button

        SizedBox(height: 100),

        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.black12,
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'or continue with',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.black12,
                thickness: 1,
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //         elevation: 0.0,
        //         shape: CircleBorder(),
        //         padding: EdgeInsets.all(10),
        //       ),
        //       onPressed: () {},
        //       child: Icon(Icons.facebook), // Facebook icon
        //     ),
        //     SizedBox(width: 30),
        //     ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //         elevation: 0.0,
        //         shape: CircleBorder(),
        //         padding: EdgeInsets.all(10),
        //       ),
        //       onPressed: () {},
        //       child: Image.asset(
        //         'assets/google-logo.png',
        //         width: 26.0,
        //         height: 26.0,
        //       ), // Facebook icon
        //     ),
        //     SizedBox(width: 30),
        //     ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //         elevation: 0.0,
        //         shape: CircleBorder(),
        //         padding: EdgeInsets.all(10),
        //       ),
        //       onPressed: () {},
        //       child: Icon(Icons.apple_outlined), // Facebook icon
        //     ),
        //   ],
        // ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color.fromRGBO(120, 6, 84, 1),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
